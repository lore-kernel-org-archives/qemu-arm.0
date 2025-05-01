Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp274823njj;
        Thu, 1 May 2025 08:17:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVG7+0iD3VcvXbe4p5xE63rLn30k7YdmrDZTwi9VWaFakd2nS4HmuFNUdL+hdEG3bS2SfvIlfy9lFzZRw==@linaro.org
X-Received: by 2002:a17:902:e94f:b0:224:6ee:ad with SMTP id d9443c01a7336-22e04234bd7mr63072165ad.44.1746112646295;
        Thu, 01 May 2025 08:17:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746112646; cv=none;
        d=google.com; s=arc-20240605;
        b=Ocf9x3xFgODnxOTzngSXMJQQsZu2M3qoXw5Rt7nJwiHPwAa6gPq8xdqC9ofFXis4Bl
         09NKFS9Mg2pfzcyITJqPD3grAP2eaJjOKW3sbp8QEOaw3dwCODwu+5upDeecaubmPA4X
         s6A8A2I4suIZJZzfOboaGGUN6yqzLc20YFPCWacwMJwg0s1qCry17A1NAQ/F7k9CQB+S
         ofStk/Rrpu6Ysl/VvAw/CsGUyVTib7oW0LPK841rnYtVqXOoC3SC7VNY+95Vjq2e+EI9
         yGWm6VN68ijCW2JMp6ed+VxBe3TRoKBTrU/nWi2P6dbrEZ9vP8298oXauDvG7bQi5xvr
         gXrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dy64AXLSg33oFDxGg0PbrM1b8FWcFNT8FYGR5t0yQQ4=;
        fh=trmmp3GpVjfXaVGgu0oLN4gYFt3c5RX4JUfIA2+Jpa8=;
        b=Ysld4G2ME0MIQIE1l8j1lQdJcRwF6H36sBRcWXsgvTzXISvgnYukVmC8ydmM5euSxH
         64fgLeMQE5MnNWyL5x1va3KmJ9dEbbcV/lXtoNaKDnB6VMHF72bY64rxGnAqwg0r4C2O
         PeDoCQIMQLdCXbDkSta2CGZaCCStiU6ZyBXlWZNk/i16mNI72PbFTMkA35xQtVDAuFQz
         lYYyiAekjj1D2HKk31iPBvwcNaQwKd5GPUF5xnlMchqkcUVZAIcHETDrDjOQ6B64hHkc
         PB5ozwl6Cih5lM1v+K19IyVT5loCL3WkbABn1F6KCrJ1Mw4YmtqHRDOxdiwX7mnnDjZ5
         Cbcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ThFmvGw2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0ba9d308sor6269835ad.0.2025.05.01.08.17.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 08:17:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ThFmvGw2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746112646; x=1746717446; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dy64AXLSg33oFDxGg0PbrM1b8FWcFNT8FYGR5t0yQQ4=;
        b=ThFmvGw2c4adQqUgcPZfs5UIuNpEvGiC0OpM7Jo0De8xRGzwXKLbyjfTsqYisajiYz
         E+fBGwUjc+Ahya81RSm7LpZS3ltaw+JDSi0yiE4WchOK+4PznT3kmB7hbapMIWh9+QxO
         9CJDIgaBEH/Pbj880i8IiwSvuMsZ3rn1FM8HV9fZW7tpMuySZ5YzHDURzt8uFznjvrGv
         yycVKiOtLIKi9bvYZYUXBVwWDIG2Zzs/CRZCKm/OoUqaMUncX4tpS6EgoMJoLyGgE8+C
         2vs/DNEJnujnruoMySo8Yj5p7kVls4H3bSDxmX6qXbhqTlDlZ9FpNe7lyi7yhQmrY5mF
         a0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746112646; x=1746717446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dy64AXLSg33oFDxGg0PbrM1b8FWcFNT8FYGR5t0yQQ4=;
        b=bu94XMmwhwq94PkBYJUggmxnKXUeSkc/boR8o7NyxwINbhH34CjQDBbi/+XHF62+FO
         qXbLVw+UJxP4LJhut/C+Hg3uRKZqYLWlvg7zR9tx2yctPmJLNEQ+9OEkwrPOUGT2t3ih
         GrIpsreiyjygvH7gEeF7277bSeFRV7EKbM7XSlA3HvjM1R08fqkZl8kEGT1HFn5z4lmC
         AvmQ7NuTSHUWIC7/rYAVVQuADlyOtFX4LyM8bvElzqZSJO2mwDLQy+iChGTEFP/l01oz
         P9lq+SRafRmzc+aKIrAEYFJbsbspTWBZAGzFGsuAI88dxYO+pvjHTAKpZ1XCLhISxmaW
         fXFw==
X-Forwarded-Encrypted: i=1; AJvYcCUiQJRQpnK19Bpmied2oRP2foaBsmyeffVzOANm5oUu+Zxi+pKMl1gkbjlFNEjZbMX4S3xk0vghEKdUAg==@linaro.org
X-Gm-Message-State: AOJu0YzfjE21LrWjb9umceDQFi2wSE0ZjQhr0yTDkf6agG6Zbn1RzNHG
	+tQ7smuMxRMwL0B3EoMXF+OY36vRae1KCuumH3dZCIBDvxQU5JXBiB9hCeIm+MnzTA==
X-Gm-Gg: ASbGncsANAcnTInb1jGnNIS9NqregxTnQObQ1zDyiZcPFLsC5dzDnvP8p0gZemPGcNE
	vzsRty+ctXmlka0eTgtMVZZzRvXyaJJ6myhUlB6Mq4cymxCAsM+JsXULyH+mn35UhqVuYuZ9PfC
	YdByk3OoJWPBv+lv6SeKoLtbEy/ddAcf4OBSaSPBdzRovZjiIMgD2pKfPovo6YtxESGlyydERbG
	KVd4q/6L4KNG7LxiC5SP7HVq7lIDTaIe/QXry4zC1IrXlcMdOfySDXUdjHuVsVpJMFlgTeGYS4z
	ZNgxEK7Lc9MEIFZbF7t3hoaRK1Vicx2OFzQjm8nkbfZeHDM7B/oezQnrp/6DntpqIklTwQqLRx5
	nggal4fA=
X-Google-Smtp-Source: AGHT+IHhEHrWTzObUpfD2ICW5GU6jqOmtHEYur8ShlNi/oGjCpkvd87Fz0ZVUMYC8k/Hng5SFchK6Q==
X-Received: by 2002:a17:903:1c1:b0:21f:5cd8:c67 with SMTP id d9443c01a7336-22e040e45eemr53848915ad.31.1746112645853;
        Thu, 01 May 2025 08:17:25 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e0bb04bbfsm7979095ad.13.2025.05.01.08.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 08:17:25 -0700 (PDT)
Message-ID: <2b9b7a9e-c720-4c11-b650-e5e34e3a91f7@linaro.org>
Date: Thu, 1 May 2025 08:17:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/33] target/arm/helper: expose aarch64 cpu
 registration
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-22-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250501062344.2526061-22-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: DJCH/WimxTDo

On 4/30/25 23:23, Pierrick Bouvier wrote:
> associated define_arm_cp_regs are guarded by
> "cpu_isar_feature(aa64_*)", so it's safe to expose that code for arm
> target (32 bit).
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/helper.c | 7 -------
>   1 file changed, 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
