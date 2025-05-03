Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1657194njj;
        Sat, 3 May 2025 15:48:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVGCEfBFg3eErX7zunPqbzCllW1dfVW9nXLt0t49Ev/8AHPM4PtDnWSmFz9ycpOaajgGA+pos+ZCwLibg==@linaro.org
X-Received: by 2002:a05:6a20:6f08:b0:1f5:8479:dfe2 with SMTP id adf61e73a8af0-20e96205e5dmr3476130637.6.1746312509664;
        Sat, 03 May 2025 15:48:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746312509; cv=none;
        d=google.com; s=arc-20240605;
        b=UXjMnxi/sxdScjO7Q5NAZwYrIx0iHB4LSH/Q1vAYc7/8ILDK6sG8KDBZlGtUJ6XUqY
         7zZfd0QdiiT9Sp6zLr6JXvYjci/6/IULcqlS2oU3qVReEzW9UyrUADXHuIKPRbEtB2jS
         DutE/UwoPM2Gdusu076Lalq2tYTWJb+LkROPFnKlP/4ArZ5icLwBw84xKJXilP93grdT
         TbJMqBc6BhtVAhczVALEtUQueWqsio5oUepsrGY/AgqSV8buh/vy/7nKWB2ppL5k9qw4
         m9Un/Cg8XDN/4XfVSrkaUgVZuWDzmYNMK7ZUnA6AFQUKXXGDbjDJBxgy8r35jziYco5P
         r5PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nVS+KycHkuPP8W6uz8n8fLyf7XH6tEMps1l1FLxvTZI=;
        fh=Ftx0GrxHzcbF0cf06JO1XVB7/440Ksi4tiWpXx4B4A8=;
        b=V3+ekonyxLIIFsUpRwIRjJrQwKwo0ncj1qOwEm8yKweNJd83WHc6Nrzr4R5r2Sq32H
         AfChVmiI5E9CqRmXl3jgBFln8qxlp8oHvAsl4BUWBPIEzmqfxcHRs3m9wca2vL2f4uDs
         FkfsW36WKIdl8S3CyCuQzrTVzpRqzz3gwEukI0zvLGXnnqtMlUWBDgdp3p+ZREDREM2w
         DJhhQcMpHSSiubKFt2CN74/RAXbvuN98iJYmOpLEByt+QRCUpNEHRG1qQyFaRXPPFppi
         7GXeBxEaVFqYgEa2rrjsADT8T3kzXG4Wgt6AOcCz9DJk7Ykd9JtTwF+FTdDCH2p6wWP8
         5aJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bm7isshF;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404fa10cf0sor2907562b3a.10.2025.05.03.15.48.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 15:48:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bm7isshF;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746312509; x=1746917309; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nVS+KycHkuPP8W6uz8n8fLyf7XH6tEMps1l1FLxvTZI=;
        b=bm7isshF3dLlC3i0uhXC3DT9oMiBDsl4st+NmpHWsfe21JVviXKuzTt+UoFbp23jAE
         h7756v1g/dNea9SDlkWCqBbmaTUiwUcCpZfaxhSzD1xOBL86YEOgZYp5NwoYyARlLnJs
         LIgiNWTOO6EW+gVXccidAF+Gf3hJkHcTpRt59h1kZIPdvLsXQM8cejuUWBQMxKwSb32q
         OM4Yk6jjd+5wnJnoVfRDDBVXwkUiQnf3FF5e6PZ4V7x7hs2F3V/UcW43iADUN3DQoVhy
         Jju5jLVB44YSYCqet5kNgAaM50bYGihAfeLb7v+GEVdY5bBJbh4em9UlrGjLpcw+ZIW0
         S8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746312509; x=1746917309;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nVS+KycHkuPP8W6uz8n8fLyf7XH6tEMps1l1FLxvTZI=;
        b=nVHjXLI56aOJwXOnJrkuDPY327qLi6kAQN9yqvlraeERMroZ+2C8WvhCnBfQFeKSCe
         fwMb8Rpu2xJj+sTEfySd+LKQkywld9UEmWpGzFKR7KqVUBhjjbyUOGFB11FQCfWcEDco
         FNXPoH1IuS19QT5FFQ3ho33tmUBWuxCz6mUkchptqP09ZO4T95D5i3fTOnb1MEqO9oRR
         vTwwYyVu4QPlZmPfMnCWFrOxR0MSQnmfO/8l2lxaYHEH3F8YoGzXbCTdwb/zSVSdW5mt
         G86/seSMwNHLcZgo1LCk9ZoOIryzv0BTHDu19ca3M5++O37qUWt36O+DnHyN/wSOhFKD
         VlkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUwnkK8ZKTmcjn+xmVZs+bvYBHFXHH3PVWfka1vwbZtg6PbbEYxFFUWftKBTXyA3gxO0CUZPG2HgBeaA==@linaro.org
X-Gm-Message-State: AOJu0Yz4XtLO3hU9bUR/0SYSlZA7q1MDdkPpU7NDqUt1+Apn9YNaCkIO
	6TZErSNDwm1iVWCFV9GZA9KYfg6mdtnN5qLTjr44StEV2dg7VUPvG1pyd6vUfXLvdw==
X-Gm-Gg: ASbGncv5/I9LzCGLhHTpDtzxz2tYBM8pYJ07KbHDiQj9Wh7BYgximtrZ9Cr9XNE1fdi
	KKAkdtDbcqMK/NSYF3gKMAqoJJE2lIZL6Vo540+VLbqqObdCU5n03i1RrkHYaUGk+xpOd9MqVaB
	lC4IMkReq3oeJadiLBrpUx2N8VwHCCnJVzwnLiomsbbXiiUsLW4uNt6iuqlwU/4uXHwXlceOwSk
	mYSm6U0BTpbSE9FrM5DgHrKT5XgswlD0K4vwgU7plP1HMdIbGcLdmL9F7dgWZ8FlNZN9X4GgPi7
	SrqIF87KwUBLOgiNYryvwBO3x91gXRq7u3s3cTObzgrhewkt1HGXmA==
X-Google-Smtp-Source: AGHT+IEssVPbixRlA3/C3mZ239uDlY27+FZE+4B5eGQOr+ig8PfKullwsS+MJlf9YXhuC/SqJrnbIQ==
X-Received: by 2002:aa7:8b4a:0:b0:736:62a8:e52d with SMTP id d2e1a72fcca58-7406f0df3f2mr2759191b3a.12.1746312509170;
        Sat, 03 May 2025 15:48:29 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058db8f34sm3888793b3a.37.2025.05.03.15.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 May 2025 15:48:28 -0700 (PDT)
Message-ID: <3ba2f0d8-ce65-48a5-a662-f2350903a5c6@linaro.org>
Date: Sat, 3 May 2025 15:48:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 30/33] target/arm/ptw: remove TARGET_AARCH64 from
 arm_casq_ptw
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-31-pierrick.bouvier@linaro.org>
 <a6fdb501-438e-4591-b166-87c8dbd14887@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <a6fdb501-438e-4591-b166-87c8dbd14887@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Pei/GYRbYaYE

On 5/1/25 9:24 AM, Richard Henderson wrote:
> Are we still able to build qemu-system-arm on a 32-bit host with these changes?  It may be
> tricky to check, because the two easiest 32-bit hosts (i686, armv7) also happen to have a
> 64-bit cmpxchg.  I think "make docker-test-build@debian-mipsel-cross" will be the right test.

By the way, I'm usually using debian-s390x-cross for testing a 
HOST_BIG_ENDIAN build. Is that the best choice available?
