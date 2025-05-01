Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp279377njj;
        Thu, 1 May 2025 08:24:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW7SKhdpfkeyAruWO/R63rVI5cPGrltoUkWa94ObMaTSPMGi3zDFsmE93IoHJEqmqs9tzjjDT6XtSOJMg==@linaro.org
X-Received: by 2002:a05:6a00:2189:b0:73f:f623:55f8 with SMTP id d2e1a72fcca58-740491aa534mr3700733b3a.5.1746113050240;
        Thu, 01 May 2025 08:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746113050; cv=none;
        d=google.com; s=arc-20240605;
        b=g+W4DURyC+bCs0vU4EscOYUppcKfzgdEOhMSVQB8bMKVZQouv1b0VR+F8FGZr5HYLR
         YB+NYywuKOcPM18dC0CScxJp7ZkXXNiQnSPn5USjsuKCghE25fH11k0EVY2t6mtt87yn
         z/FcjpTgnfb1iIKouy2nOwMRMQ8HvsbYuiP33hHs3N0ox2aYApATcVCKwYI67h5zeRDm
         SKQ6wLjG4fvipZqbydmSoOGp+8IVh/WOuyW7hph+sopwTJ8dS1K93QQL+7EDAz6nGHrQ
         /MJMBC2EMivgh4+RPwm1qoAMssvsWKex2pc9bt+EpvieiYUsSl8NdXLPrxrnOAgVdePQ
         K2xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=oTb37Xh3764UHx4GkunEtiY4YocHVNCV/2Hme8te8Ks=;
        fh=2jppXTQQ3hJdAtDOZtIMOoip7ozsO8yQ/gAJQURo3tI=;
        b=ZrWlIcszcmnevGyXGvbTkLxjwSuTLYtRg/lhkK43YRaPphgfwlPwj8IjsPoo0s23Zx
         rWppKk33gX0XfJAcbneUc+ClbXM8/q4YGbDgt/TdE0l0yfpB3J5Y3Px/nw5H6zxmTvLn
         ag4A5l14+tThKut6BIfmg9Fy3AsnoIrc6jOEhmx+x17iVwhQgiV9kB4r5sXuD3ntGdFc
         pvSKbzjA4oFp8rfpRUiKnKO0N28g4eU8ufyXCOZ14v2uvlqgydySDTzEzegTQbVT5RDa
         BsTmzp3KJUQ3GOL++poa1FQLidLF6FRthAlHkHD0letWJCEnzrMFWoVHRIt6Tw+iXbHr
         deDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ESeKOTXK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b1f9d623094sor592339a12.6.2025.05.01.08.24.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 08:24:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ESeKOTXK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746113050; x=1746717850; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oTb37Xh3764UHx4GkunEtiY4YocHVNCV/2Hme8te8Ks=;
        b=ESeKOTXK1J03VcuNRQqRvHwMnEFWV2QyMAfV+JgCXQJxVppxRuNqHnlZdsfNzNAn/R
         ZPSxmDWLqUfYp36qq3aFMjl9gy6GOvFS39O9nPYnQQl3rEj8rrl7eH1ZMEGLgoFL6wqt
         +5UDOi5yx7X7+dlQ7hs2B69wUmldmzHD+Ue/Pe+6nJcZeDs8uA/H7pNaSVYt6KUILEx4
         wOdAUtFAt2QGTFyaPYtAied3nIE8tL8sKu0+9iNybMlgseWtMpOxqB2PApMZYdLnsRuK
         nR7RsE4iBjaDD0dreUKTM2ddf3NDmyyJNNXtbgRwS5kc95llRDNPN1gQZx1wYTjC5Nlc
         6tuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746113050; x=1746717850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oTb37Xh3764UHx4GkunEtiY4YocHVNCV/2Hme8te8Ks=;
        b=E66RMi4LWqzkGmzVfHy2X2j3a0YncUogp1mQwGyeKZXP4DTv2pgO65geOo6BRDt0OK
         uDJxNTC+6DgilBNsBOpi8IayYhMGCpbWM0OLdu1U0YSW/mU+ud6nU6hAAYc4I7kd2bQk
         NwHLZFifvZbZv6N/mNy9l5QD9kH0/jtlhF3TKAdhdvYlXBFDQtiHhoL6HAq1k90Uop7r
         fwTkl41fr1EHGlEIztaJTrxhs4wG2S0GP70oUWCnkSI740WPIOPdrg2ibVSjHbIU6k8C
         65jTzOb84+MIm17iA4PpcUqkA9nJAEFfg9p8Z2Gy00Z/1hdOiA+DOv5hzEvwlkiuexOT
         Q+/g==
X-Forwarded-Encrypted: i=1; AJvYcCUuuPiaJJTNiD4jcx1IseDJ/AmcA3q6rMe885sV05rYR7xQFP36pPf1A1QZ9s2Ek0w6Hnn3Csc0283w7g==@linaro.org
X-Gm-Message-State: AOJu0YwgqCspCh1aU9cmSqarn8tEp1YNMO0KSU/qA8aKYpB5BD8T/8fy
	fUTi3X+AVqgsDotl8lirJ/zlbXyRfI2gULm6Gjq2UmYy0qJs9M/fjoH9ttPSZ06q4w==
X-Gm-Gg: ASbGncsRNBMh2EQs1N7amAJ9X5HRM29sv9wj1AWPltUAhuc7A6cTYsa8UAzMJsa5p/J
	6F2Ky09vg9WXz6GmqBxyB+AAgv7yduoOaJGn5A6auf0OD1dhxPc/XYgIGqC1Kli8jeNcsqt4eaW
	utbxbo5mr8gvyGQqpMWMY3uA04affEmhox9BhWTohXWDF05n2iut8amIp7wkEtEHs1KxhEks8E7
	CQO7V5ryvO+bEVYw2zqkeb4lYkhlEre4lPCu6B3BV6tVuO+jdxhjb2cECq1VOpwzt5AIiPh0l0p
	qGWQnxy25y+C6kWGHNVr/mbMw1lgO0MPK8XMPPa+uNy4dhjgdcpHKQ+hrD2DIw1ZtpMeJ9tTJl0
	Jbg4rbUk=
X-Google-Smtp-Source: AGHT+IFtYPPoKV22gQdXSnGvoCfMB1I5lAUTgyrS/ys3+0aJbnk8DbbtBSmldZ23PrL2j0wpzoqV4Q==
X-Received: by 2002:a05:6a20:258d:b0:203:de5e:798c with SMTP id adf61e73a8af0-20bd6b4b359mr4810347637.18.1746113049768;
        Thu, 01 May 2025 08:24:09 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404eeb293csm965322b3a.10.2025.05.01.08.24.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 08:24:09 -0700 (PDT)
Message-ID: <e01f8acb-bf41-4ce3-86be-c576a690aad3@linaro.org>
Date: Thu, 1 May 2025 08:24:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 27/33] target/arm/arm-powerctl: compile file once
 (system)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-28-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250501062344.2526061-28-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: f/crylpGEeNo

On 4/30/25 23:23, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
