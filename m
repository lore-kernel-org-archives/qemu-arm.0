Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp819616njf;
        Thu, 15 Aug 2024 04:42:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMEPJsV5iImj/N7Z2qC5JpAWw6nJuq06OhTC31f0JuGB92uaxrlc7CJMmTQHLokDe8xpBOY2M+pK4cYFslc8RT0IkIH37j
X-Received: by 2002:a05:6512:3e20:b0:530:daee:cfae with SMTP id 2adb3069b0e04-532edc1de29mr3184882e87.61.1723722179395;
        Thu, 15 Aug 2024 04:42:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723722179; cv=none;
        d=google.com; s=arc-20160816;
        b=kALff+f9QK5AekSu9sPdz5eelUCZWDohk08V+yCNXQG6/BuJSvqPyh6N6u5y21Zq0s
         Qt2srcswMkglJCb9MYwOHGQxXN4BTWbmFtXw9R3vax3MU7/YCJG23YxeK1hS3CagejeC
         Y74kwLmtpEF1GJIfAyDkAnWY4qz0yhzd/M+pBdmOM62zJsYx/LvlkxMlr8QA442s16WE
         kU8YhMdfp9mvGQH9TNK6N44JyibU/uTx7wJYmUjiHTbrwyx0wW5bpH8cv/D6Zld5k7a/
         qVHEex2e3eRZ/VS9q0s7GAJeTFXriT5waD/g0FiBK52EPHQwnhTB9nwtgwIStthm07uL
         BFfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=gZX6jsnmmIcrh3iDFhCFFrxE/sOzMmJohzr4pZkqYN0=;
        fh=/ApISeBGYZ7p5fnDpOUyi4MTfMNMBsC8FNrtVLwTZLo=;
        b=vkXCvyr9Yhah2woLLIYvRnHXKTeua1gq2QJ3JRTcsHbo45+NxMSvCLG2OwLxOf2xNc
         SmWFaG9pKqr88+6Sk/OnkrblISlh3Rzsfv6qE+XJPs/5rAJDKOw2ACia9TodsmMFjLtN
         DR6cvyohhfnE6R9pclPlnNVIzEkzpS3S+fYoNVTu+idmwcdMuENn4G5kRTxLWGDy2nkz
         i9fohWfSBJoUQjg4t8SHFuJuMa2KN/cH2zL1MHtgZVzpjC5xvqgPvYAoO1l+XTE/PAnr
         PzZngvfG8WRjnpzwmjby/wyH0S+mlDMkjJReHZSuCGk5Hp7n4/YAMkyxRTk+HRPxgCda
         tdbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ImuPxbn6;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-5330d3f14d8sor395107e87.16.2024.08.15.04.42.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 15 Aug 2024 04:42:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ImuPxbn6;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723722179; x=1724326979; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZX6jsnmmIcrh3iDFhCFFrxE/sOzMmJohzr4pZkqYN0=;
        b=ImuPxbn6jOisaPO/WYt3FG/C3RY0IwIFSgtFdjj6qjlD2xNp05nIRXXB1TiTNk8Ppx
         HRC3GL2zgZgy+AQ3GOcSwYo902P5kGo0JZq0NJqRJZxMyZmHa79r0nf5/zRajbw8lxNf
         whfzx1gyk3EKvraFRrwGBMOWs/ghvrNcINw1FfETjYS0eOU/27+R4OErALSc7tfaX4Pf
         ly2lbGqy4h/5kIfSLCvRPx4/6qpJZz6E+SiRblSBNe4uqiA+da4xHwb1CfXkWXCkc64h
         Cr243Q8v2UVfUEb+SHt/qnB8lGlbkBFXDXd0FWFtsJRoWlaSyCRvotCp0qfz08ysy18V
         uoNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723722179; x=1724326979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZX6jsnmmIcrh3iDFhCFFrxE/sOzMmJohzr4pZkqYN0=;
        b=dDfm+iRfh6hn4tXfhGS9/tOaZz9Q5CLncZEQbTlx5uhCIvcXoA+CyNEybWR3WFSq6v
         6/XalAgRS9RMDMXEXzwryT7JOodS/OwjqCse2maB3O9N4KMXGvIeOkl5bYhw6FzhbrXE
         GEoOJHoto6J7iRqHh8jcOsDnXX4OAWkGVKISkQMjLihkncPnQ9siO8JSTJFKFmq8QJ/K
         5LQMLjbePAiObRm7o7cYLtVZge8oYA+p/tPcaEB196lix47qNDOxrwhzg/ERTGv9+LH6
         9QsbCJNX563ZLipAwF4qGz2+9sAUuX+lUTtb7pidXLIgP+Am1oJmgxFdFLEnnMalHI1g
         gx4A==
X-Forwarded-Encrypted: i=1; AJvYcCVr2qFSx8LS8HcTbIJiJmt7N+ub3UPrXTA5s3YhwbKECKscAGkGOMTpVfnzf7IOFZdOveMLgWkKLYedkQv2AYo5FE76s05h
X-Gm-Message-State: AOJu0Yyd+SV+2anCubctnswQR0oXkto/B7+bTa8+f9g7nfc4A6/w4fZH
	MbYZxKOo38f9oT0rMmz9Mg/uSZIgT10oYVGFBS5rnMiMmH+AwfOG7mYLcRYM8CqNYg==
X-Google-Smtp-Source: AGHT+IEI9gHqL41YuKcjVzBQQZmqW+wM/dAhI8Bvt2PqcS531Ch5JsqQHEZXguUxCMAJwNDQMrMy0Q==
X-Received: by 2002:a05:6512:b22:b0:530:dab8:7dd9 with SMTP id 2adb3069b0e04-532eda8e615mr4094621e87.12.1723722178418;
        Thu, 15 Aug 2024 04:42:58 -0700 (PDT)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from [127.0.1.1] (adsl-26.37.6.162.tellas.gr. [37.6.162.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838c6bf1sm89547966b.21.2024.08.15.04.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 04:42:58 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 15 Aug 2024 14:42:22 +0300
Subject: [PATCH v7 5/7] .gitattributes: add Rust diff and merge attributes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240815-rust-pl011-v7-5-975135e98831@linaro.org>
References: <20240815-rust-pl011-v7-0-975135e98831@linaro.org>
In-Reply-To: <20240815-rust-pl011-v7-0-975135e98831@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>, 
 ARM TCG CPUs <qemu-arm@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Junjie Mao <junjie.mao@intel.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, rowan.hart@intel.com, 
 Mads Ynddal <mads@ynddal.dk>, Markus Armbruster <armbru@redhat.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=737;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=r9fVbmhGtXasriKuB3hw4s7B3j9kUJZLR7F1C15PCwI=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm12ZW11UDR4KzRjeGFwcGVEWld2YzVTeFZKUnZHCnFjSkJvUEswSWg2dGs0cFpH
 eG1KQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKWnIzcHJnQUt
 DUkIzS2Nkd2YzNEowSWZuRC93Sk9UbEYrRm40V3dpdjZEbGtrRkxMeXFCV1c5MFpkOExaQjRmQQ
 puMVF2TWU5ME5mK29yWG5reStJaFRyVkVPNXRQMEZ2eU8wQ0t1UjhYbEVsTHNnUFQvYjR4OU01N
 Xp1OTRDenFJCkZjZEQ3a2FlRTNWS0FNS05Fdkt5b1I4M0w1UUwvSEZVSWhnazZjbEhsMWh6dytR
 aXZVMlJOQks4UDZoY0xUeUUKLzJORDEzZEF3UjVncytnaHhvL1l0THMrN3N4cDNLZEIzNzVLajV
 uQm9tT1BWR0FjakxIbW1oT1VyVHlZckxxdQphUVA2NFg1SVV5T1NnUnhGOGlpZ0J6MlVTMi9WQ0
 JOMXhZNEVaUjNFdEtpdzY4QmdDZzhiVHlYZnZFbEJoZmxsCkJKb1IrZnhGZkxQb1RKaHNVYVJnT
 DBGZFJadXNkNkI3TXQzajN3VjhEZlFIR2tjNGh2Rm4wOGMrR2QvK2RmWWgKczBxT2NYUUJQUXVt
 WTE4SFpTLzQwR2I2Y2Jxb1VDVmVQa2pLVnZRVE1xS3pFNEE0RzFIVDZvTFlIa1M1ZmFGQQpkQjh
 5Q050dXdYSUx0UTh5N0gvZkE0eGRodUl5dE1mbWJPZjFZTmNPaUtobVduUVBzVm9YM1ZsaUs5TT
 Q5QUlLCjFkeCtab2FMK3VUakpFamEwYzBkRDV5OWRmL1lxVkE4ckZ2RTYwTlBOcnNlSTBrUWVke
 VhxZWp6RGgwdE8zalIKeno0L0s1R25YUEZLK3dEczNYZlpSeS9TVTFQczV2cnRQYkJqRjcwL0lq
 NUxlQ3AzRE8yWFFYdDFwaXFKYmcrbwpyV3A3NUE1aTJ0NHlET1J5YW8wZEQrT1VFU1VyTURhSVN
 hbVRhVDBneFFTUlpVcjVwSG8zTW1iZS8wbFhUZjlnCkwvb3FBdz09Cj1UQVNwCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
X-TUID: TpNgp8rbtb3j

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
index a217cb7bfe..6dc6383d3d 100644
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
2.44.0
