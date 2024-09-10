Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1254523njb;
        Tue, 10 Sep 2024 05:35:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWh6H3qUiAMWahYYIac9Os3mdlEDq9SVbDu7vNaSZ0AF1VQ40ozsJczgulcRRChDISWnUfByWRBsqVhjw==@linaro.org
X-Received: by 2002:a05:6402:26c7:b0:5c2:6a52:ccc8 with SMTP id 4fb4d7f45d1cf-5c4015ded0dmr3411273a12.5.1725971742994;
        Tue, 10 Sep 2024 05:35:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725971742; cv=none;
        d=google.com; s=arc-20160816;
        b=LSjRwZXZeBa+dgiPN5Uq+VDVrV37ddrI1iCD9E9AJDfO88IfwfZ4o2LFdEzO9hBCGc
         iuiskz2z2piKDZD8Xrbp6Fji+eDJStEO3h8S7/djdQ9F57Y3NjoZVCqIg3urYQlRQzlS
         gRRrrJ9yyzUNng+TYVX1isrAk4+3X4reTt0ZCGjvwP91bnI29YhPXLzA9OFIl/U6TMwX
         +Cld8ZOoPLqT1juhQbGymMLbcCBLoJRbeS9uDNjRm5m18wj0xm/IB4zUigXe9L8zk5o/
         /U+n653BMzbijXPmr4wBtl7N6SfpGS7zU2fQQTC1hY8fAxkizt73oqdSFkJ0PZ1q5nnA
         2ehQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=HKQ+Tr9nd7UKxDYpE7u+hcEQP2VtRBhfmqRFJl+mGfQ=;
        fh=SIFjNnys1JXqcqFkVs5yapG7t8n2xl7k7k//48DnYmY=;
        b=giGbSM+WMANumTC2J9UUSWnyC2N4319sdniVDu9KGV83OZvzNWoIkya57wdfH0b1w7
         HJIgowV24MqUahQOTToGg7H3OaWhDPGh9eZdPob/ltRw6SZ1pTJwJl0HAFPh8TO1u2qK
         B6SMMBOU1dO+K4IqtSpOuT3+9rMOq4Sh4V/1O6y5xWjqnwfheZSAeIaALhyMYCC+YRp2
         Cte25z9tDYjIUPe9mKDYKUrfrkJLHDrDKYR37U3l0xwLk1MdKRKJbKpVva3wTy1Fu02r
         ui21dTV5xxpR1GwdM1Kerld3gyE93ePtJ+PffOXbEURfigDe8IrHNOX98Adc9FSEuT1M
         6LrA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eIJNGNQF;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5c3de3d16afsor4163395a12.1.2024.09.10.05.35.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 05:35:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eIJNGNQF;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725971742; x=1726576542; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKQ+Tr9nd7UKxDYpE7u+hcEQP2VtRBhfmqRFJl+mGfQ=;
        b=eIJNGNQFdjLkrPHtNJQ1oZc6L9t0/lS4Cwpf+b+NqGhFVjmFiff71NM11IPXTy69b3
         j+xIa+Z2qzXJbWkGACHhp/sdFQcNZ4mk63CA+XyxHROA8hSMj40Z7UTX5engittCWp2B
         lz53V+yF9hBCaTO10LGR5JC/vsjT/EogtrnRfdnHvoDPegkif0zd/58PEOGqpiyONoTP
         ppf/FW8SEdWfE0uftJaMt0k09uzbWGGxD82aS+57kr06pIeFjS14uHeZIX2Tnu2ScTs6
         oSJX0yiMWobVqyOEgnADmuieLc2FL3FKGcn+TRjss0EFoH/8l+OseAnmLcc9nl0B9Epg
         JHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725971742; x=1726576542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKQ+Tr9nd7UKxDYpE7u+hcEQP2VtRBhfmqRFJl+mGfQ=;
        b=XG7uRrJhBaWLd9czCsI5YNa+Tl71z6BqT65rM6fnIaJhmnpX3GAW5/HT3K5MGQblch
         LYK9YqOyGIHTeSAt8Cv42eNAzdX9xIXgyf4B5GVzEz29R06VUzAPVyrr67S8m3eutkao
         bq9dFI7jD61vQSTms0dn3CxbawW3lXSiE399eIDmovOgUSOxySxZA1bl0b1B6d/KpkXs
         JUoHTokFE++G+sihWyk7/eAdHUD9XqKjvSrmaFjnL6cOB76mzNJr9osX2Jgz965SYGes
         t7K9ygGGvDhQijGdcCya/BXDDJFwUHvm+dmkx0Ks0cHWsvtoxQbdT9PwkT/4l7Oltpey
         f/NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUVbDJtFPUsIGQsGr5CakajpJAspXbjjRYilBDvJZP925pbqhzvUhf42RkFc9qEyB7tiSEcwHEfYds/w==@linaro.org
X-Gm-Message-State: AOJu0YwRsHRmQKXQuaRtivk8RjBPh4HAFlkoBRmTh6Fv8S7Ou1gdtabz
	5TGSqkcFe2C0lVLhol3KogZhnlthAcEAyee4n9SccbVu+3QXYwkyLvc4Ik0OXPcr71Mu7RljIN2
	ACwp0Yg==
X-Google-Smtp-Source: AGHT+IEVSPykWMZ9Z/shkaJ4YoprIRTSvJPbzwXMZ3AskobBgVmAtIQFdriLsTbCS1EFKzIXZchzUQ==
X-Received: by 2002:a05:6402:5209:b0:5be:e9f8:9ba4 with SMTP id 4fb4d7f45d1cf-5c4015ce12emr3119613a12.4.1725971741720;
        Tue, 10 Sep 2024 05:35:41 -0700 (PDT)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from [127.0.1.1] (adsl-234.109.242.225.tellas.gr. [109.242.225.234])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd41cd7sm4242994a12.3.2024.09.10.05.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 05:35:41 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 10 Sep 2024 15:35:11 +0300
Subject: [PATCH v10 5/9] .gitattributes: add Rust diff and merge attributes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240910-rust-pl011-v10-5-85a89ee33c40@linaro.org>
References: <20240910-rust-pl011-v10-0-85a89ee33c40@linaro.org>
In-Reply-To: <20240910-rust-pl011-v10-0-85a89ee33c40@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Junjie Mao <junjie.mao@intel.com>, 
 Zhao Liu <zhao1.liu@intel.com>, John Snow <jsnow@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org
X-Mailer: b4 0.15-dev-c2c95
X-Developer-Signature: v=1; a=openpgp-sha256; l=797;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=cb5hfvQlqbMpu1WXDHeHVpn8WY1kxaNKXHZwF2lZXrU=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm00RDBNR0Yrb0hwVjVqWXJNYityRmNmenZpMVQ5CitMcnZCeWorRVVPaEg5N0lr
 QnFKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKWnVBOURBQUt
 DUkIzS2Nkd2YzNEowQXJlRC8wU3FlTERaTG5wQ2NLN0lFMWRGUU9hRVpXU1k5Z3pFaWFFdlJKNA
 poa1V3VU1kUitqS2FZOTJ2VzZQN1ZCdExXSmpOVVJMMWpLdko4NEQrZXJweGpTQVBuYXdzcEdhY
 1RCNlVLYzMyClI1Zk5iRXZtQ2NXM1BoT1FlR1hiZGJjYkhBUXUwT254bkkvYS9kZzhPbTlvdmxY
 U1l1ZjEwNVlpZTlaaGN4Wk4KMTQ0QW95NmthZmEyVTlhT2tLTlcrcGJLTTlPTFdBbkJ5V05NVzd
 VOEFXdWpPa1J4MmJFMVFuby8zdDdHSThIbgpZL3RScUJsWVRoWUVuUE1kYzJpNlRlc09NV2wydH
 BuRUtmd0FkVkNWWjY5Tzg0cHJTVEhXbjJpaVhTb3BjOWY4CkNnSCtMMlpUMGs4M21uQnJOZHVxV
 ndCRjc3K1lkdGpMb2pWMGVaV055LzV4aWREVjN4YWRLWG55R0JNb3ZBMW8KUkZScXg1S1FTY280
 b0VyYUY4VGxKQ2IxUTBYUDdZb0l0dGk1bEhqUy80QjB1bER3WjdLY0RqMWVNUWFJMFZTcgp5clp
 GVVh6QmJtT2tSZythRDNlQW9FMVlzRUU3T1AwakR3OXpRdUVURHFBaEt5b1VRUzN4eWh1WFR4Zm
 VCQ0x5CjQ2RWhQSWtGSEJkMWdybTBpZWxUQXk3RGIzSFRFemgyUStkOHRhWFFoRTVFc3cvaTd1V
 3VBcVlhN0t4L3QwcTEKdTdDY1ROaGNXWWtvNWRnN0tLVmNBbE5QMUpuY2JQMlhTK2ZkOW5TRGRp
 eFR5WGNTa3l6REcyaEpnWFgwZzQyaQpEd1dxdlo4RnB1aTRjNHJXQkp6TVJVUEd5N3NRYUg4SEp
 6OGlVY0VUaDYvL0YzMS9iMnFDT3QyZTVobUtzelFwCmM3MnZ2QT09Cj1CMEtJCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
X-TUID: XFOhrH24ILfE

Set rust source code to diff=rust (built-in with new git versions)
and merge=binary for Cargo.lock files (they should not be merged but
auto-generated by cargo)

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 .gitattributes | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.gitattributes b/.gitattributes
index a217cb7bfe96ff6c8548f510c62c6e16b2d5faa9..6dc6383d3d1199eca5479353cedb6d83d98d95ce 100644
--- a/.gitattributes
+++ b/.gitattributes
@@ -2,3 +2,6 @@
 *.h.inc         diff=c
 *.m             diff=objc
 *.py            diff=python
+*.rs            diff=rust
+*.rs.inc        diff=rust
+Cargo.lock      diff=toml merge=binary

-- 
2.45.2
