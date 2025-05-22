Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1632597njc;
        Wed, 21 May 2025 22:19:44 -0700 (PDT)
X-Received: by 2002:a17:902:ea01:b0:231:97ab:9544 with SMTP id d9443c01a7336-231d452d4f0mr362174635ad.41.1747891184218;
        Wed, 21 May 2025 22:19:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747891184; cv=none;
        d=google.com; s=arc-20240605;
        b=HuuCzjBbAwTpV62/veEUkv///hYHwgycGUmdVr/NxrFhzfpP5RT2lnvu9Clp6+Zyb6
         fu/WJL14DccI1lHubuiP8aquhwAH+6u+nICDyPTSj2Wyx1vul64TH5DRY0PQJWAar9ra
         G6PL98g2AWkWixFU9vGlZCidd+dR7RBXfvQjgCYbchwyrKt6Zp9lCPJebefU7m9weRTA
         ZpDPwU8KDVGScQZmlhxICw8fGlN3N5/nhFO33OebtrsTIyK9zdRzXkQN22CedHtSr88P
         9qbD2PHohSH9FpUi/whNOL/MNq5RV20ZSa59S6ba5SURtAFr7C0ZZDVDjSVcP10lFVOy
         p/wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PF9DBrhsOTFqE8++SPnSPBoNs8mjJ7ckZTobz4u+DMI=;
        fh=WiCG7F03YbG3IMmuP916iIopwAXtmeg3pxguSmumvWo=;
        b=LTha2o89bkUQQLML7rusYNpPXMwCpKn/cW79lUtyqeXSQUpgnJ8NSnu5fLVHPQn3Ui
         gETzhKZAwk9g9RfkJGAp8Dbt2hzLjHZDWCbOarX622+5HbU42BaBBxxYnbObVvKxPEf2
         fZpE6FTPzEIqVnLP1GV/vlugBWpAqGZ4M1kTFvjCe6TzHcpXspWKjitIW4hK7PuhUjF7
         kpXEFAb3LHO+SQw30zxgX+mJIf6L2SKN0O1fy4Rhg/2pClJAuK2YSv5Al/MMmCC1KmNf
         HDbRT4V96KUnVBQQGExxj7UCXKKO+szMIx4EIUgwh3oJZYX1BsSC3kIk5k5VnrUCzpWI
         jCuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=LrBrKhM6;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-231d47d9a78sor103661735ad.0.2025.05.21.22.19.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 21 May 2025 22:19:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=LrBrKhM6;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1747891183; x=1748495983; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PF9DBrhsOTFqE8++SPnSPBoNs8mjJ7ckZTobz4u+DMI=;
        b=LrBrKhM6Bu7ZDmtioEQmIB12hKprQGz3d154jeEWcg/ru9GWcI2QOs77geefOCrB2u
         iv184oqZPV5NoU62TJlvY1llq2MR9j//nlKiSwCJwr/iRhXeUpfz2J1JUUQCdK7lrnwj
         kqmbiQguvx3tnvaVgwo2cstsWkO/GDanA64fcD9D5t6L3m72g0ELSBwcHkRk8WssIHLK
         FXycCgBoFfyo8dhnQKlpKTM4LMzsPuDyjO2f10AZB3PZv2kh/GT0q1WNvWQA6LNChx9n
         Ux5VI2oY2DVh1M13TqS8H5IBO87NyaEvEoYXKaj8uxeLBD8hknUxQ90MqJ/EVvVDoeWS
         aEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747891183; x=1748495983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PF9DBrhsOTFqE8++SPnSPBoNs8mjJ7ckZTobz4u+DMI=;
        b=cTRdVANuTV1iVp8DVgZHK1IF8GHHoJrnvBPv0mJi9mTWLHR/959IBQS0LFrjhim6FV
         BGa344HOuXHGn+eNXe6OA19L0RjOK0OUI3gNXgT5nDudlD9aViM1irvDZw5sh3YvJj/a
         WQ/Fq3c3XBq0EVU3rWNUCf6fyOXzUPAWFmqqOvcBViyOzpWOzTuL6fVIyRXBuQ4g/4QX
         jCZ8S/Zea5+e+RCQeC2RC7k7IB+SuyvA6uYqyXK74iXrwdLL/Y4mC00rnCukW2XsH7sx
         zlYgrFlAWcY/Zp0+egUWA2WHyWdX9ryRDxX4uTAhqxuH5NO9tsy7kfMTR+q8LnRhV+to
         PixQ==
X-Gm-Message-State: AOJu0YyGs7z/Tw54C4NjtdSs+yYLcMEKUnPPgcKEffK60FxrqGbT4235
	NsrvWTbhSW88VaxDLRnb2x8Q1sr4yRHyTOVeKo+yTETdnIXc7WKktTyWySdmoveflTX5XgY0j5s
	vcIO+
X-Gm-Gg: ASbGncsnkkL34jS9875KcMIw+I44HeJEXL4vgbQ0Qcju0bHa0i0R4VdtE0j7YoX4xfu
	A82MWqTtUM4ybnYAaFiNVs/RZf853U6ZGlCBPRN2ojivItgnQ1maUvr3ojx748oErTyapVFfRDu
	ARWdagSqAQCJKQs1R2KAqlVyHxc506ck63hjU9nMmvbfYJ2mVjNwDWAB5KU1B3h5/oFyO4r1zkj
	5wri2LjkMLiEC/CNNfyv3QCcDfX4pRooK99t6YIniQdkfhQQXLk6c6gssRuo564pF87I1BscDdB
	3GfmIGhVHFTj6a/CWUtHjtBbNUOTBsA68poITStNmwAFVJQw975KJFxUqIGDgw==
X-Google-Smtp-Source: AGHT+IFJab9die+N7MMiqcb/2QSE1Lmc42YVnTc2KZjvkOnJyWrwELuYZGzNr/kiO+1T6JkyEKHjCA==
X-Received: by 2002:a17:903:1a28:b0:231:c05f:29d7 with SMTP id d9443c01a7336-231d43a54f8mr325262675ad.13.1747891183562;
        Wed, 21 May 2025 22:19:43 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [10.100.116.185] ([157.82.128.1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebae71sm100975585ad.190.2025.05.21.22.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 22:19:43 -0700 (PDT)
Message-ID: <acc76a26-d6b5-4ff4-a8d6-3595873157ea@daynix.com>
Date: Thu, 22 May 2025 14:19:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/20] tests/qtest: fix igb test failure under
 --enable-ubsan
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Nabih Estefan <nabihestefan@google.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250521164250.135776-1-alex.bennee@linaro.org>
 <20250521164250.135776-5-alex.bennee@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250521164250.135776-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: R/YemGc0EGCV

On 2025/05/22 1:42, Alex Bennée wrote:
> From: Nabih Estefan <nabihestefan@google.com>
> 
>    ../tests/qtest/libqos/igb.c:106:5: runtime error: load of misaligned address 0x562040be8e33 for type 'uint32_t', which requires 4 byte alignment
> 
> Instead of straight casting the uint8_t array, we can use ldl_le_p and
> lduw_l_p to assure the unaligned access working properly against
> uint32_t and uint16_t.

I think the subject should mention the problem (the unaligned access) 
instead of the method used to detect it (UBSan).
