Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3244957njb;
        Tue, 18 Mar 2025 15:21:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV41ssvvuShuZ+63jRMFsqpiEVwCIxRtWPThfUNo3aVboG7XORLjVe8uydAu/DlAagS9jO4Fi7HYUqyqg==@linaro.org
X-Received: by 2002:a05:6a00:2d95:b0:736:51a6:78b1 with SMTP id d2e1a72fcca58-7376d62b6b0mr697385b3a.11.1742336476168;
        Tue, 18 Mar 2025 15:21:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742336476; cv=none;
        d=google.com; s=arc-20240605;
        b=P/9fq8CXR2Ow6cD/fR3kPTCnOv65Ee0oOP92YlQiYhKu6k0pgY1IQJutlITm0epwlj
         8pfXE6gFhRTj3QvxevD/AWYtmKQ4Op9OI2Ku7IJ1jxqLpLHRwz9g2/TpfDQFPp2Q6TaZ
         Kkcl7h92a7f0Z/okxr/OcBtpjxXvAnQMKeibPnXAQV32lnvcRvjSkLPnqo8cOZbJfMH8
         surzrax/ehKMukyZk53dvsiteMFgueAowCdwNCe8neIR+ew8GCvc8QCT9OPg7JdGUizm
         2tireJ1uKnvXobuiOwJFYbGQUqe/T8sRn94Z9D3RJZT6VZ+Oi3lRFKCAaMNnkZ0ZlL4m
         qV/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=oMWyKhFjYGpE1Bc3+5PVG/lcM9O7ug1FTKJVkXkKJkQ=;
        fh=WQQKgeuWz7Yd9aHpof2nRcPDQ1aYywgjPEGVlpTCiEg=;
        b=CfYIL1u2sEf2hKSKVsBV4dX/xaxV3aFXB3TU6y6DhNLO1MB2IYIfBzUE4lj/W9aMKp
         0nFfhM7Pnmf0hg9sn9jlOLuuiOTHtAXhPFPe1DtzvMIir9Jrh1yE0VpJGQz3GvWEeSjz
         Lbw7LoRP2evscq8ZjHEUENgwHzbN7NXe4r7wMlVXFmpaiUFeudLjex1LdrTwOnpJ6x5A
         roLlK1ctGwWYq/1X9ug3GmreObC1hT9WNS0EzFCV27wmWSDNLZ7jG/LU6v+jZwcKqzkv
         TGYdZ2oUftqAtfRRx2OVH449gALu8SYkoWzsSjBgbsM2bk51FQXE/4f0ocrrUOEeFp6e
         qMGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D2dw96TD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7376d47ad80sor146116b3a.2.2025.03.18.15.21.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Mar 2025 15:21:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D2dw96TD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742336476; x=1742941276; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oMWyKhFjYGpE1Bc3+5PVG/lcM9O7ug1FTKJVkXkKJkQ=;
        b=D2dw96TD6HFPCUj3rvCWX7qhwGmPuE1TYt5oTO+yxC3ekWuc4NiA5oOYSVltxvGCWl
         FTS80r2R/Nu94BmyFFtkOvew98LE3Zz3q98ABdjWEQCe5xlIHEuh6d5PyHST4xZdIqOT
         9o8mlBVH7A7Ga1cAE4lQALtOqYF0iQDL+YFDn2II0zNPMEWUEEM18GXJ8vpkp/dFzu8W
         Cgts+M0PxJ5TLgKRCU52XMOPYKP/bmqp/syW+x8wNvH9+fPjpB1mA7SiA6SFaPuVl6Yx
         o7puGO/mqlm8rzAu1W4HvlMSfrOd78RYlCggP+bJ23NEDaqQ7AI81X4dk8hRDZN3QpMd
         Pukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742336476; x=1742941276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oMWyKhFjYGpE1Bc3+5PVG/lcM9O7ug1FTKJVkXkKJkQ=;
        b=Nzo+4fYKovdUs8WuQ7xkknpVbe7GpbskEbZJGr6Iqj4Z8Oxn+PCWzJU9qCuaQTapcC
         ExcfjoY3TuMXQamJd+acmzhpxWneDZWTw2yA/cWUqtiN9vV60uMj35wKvLPRpnc+Ml99
         RxHGjHQHWZOvjCcG4rvsRkfcM+Oa4GxKRmDnbBMObYmIfo8MRFtHngDCVzDasr0/9r8B
         pj8MehFmdCxKjLsnha+jp+8JnEmIpQeviaBLUWxjGTM83YO7fTK+rjmBk2PQsqHS3hV9
         WbdG/t8JfpBlwS92GrEtakGsC82q2HqtpXBMTyqY6Ul61p6bdk5muMLYM5NSl9Bu3Mlx
         AtJA==
X-Forwarded-Encrypted: i=1; AJvYcCXfCk5pkQx3bXpflt2dej4Jvsro2O7RCd42Jziyd2dlkFVxy32q6Th63YFBXP56AgBDo/Rc42lKJMJvzQ==@linaro.org
X-Gm-Message-State: AOJu0Yy54KjfDq0jA2ZC/UjmhPO5JDWf0g2ZFsaRV+2JC1RF8XeP3bdQ
	+SxHqwoZs6FmcplkEacWZa89mdd+2fOeHbpD4M26Ad3zvnybTKlDGg//qUVyKHQ46A==
X-Gm-Gg: ASbGncue7ioZBkai8jMsu12ETgwDty5rVv1q0vvFnCFPIjRpfZeQL00JMAcrJNcH/bY
	g2b6nQq5GoAaLE8i4I4zdaqBjiylkgCxz+WdhIh0/IucjYLWdzTs/LKE5n4ISkHF3YUdGkkguVA
	XTC2oIXXa07THQMMuJL9fPGVRr+8kWT8knaz4Kw7As0O9wYUjq2gbDxg63BmgYT+9AEGO4iBvsv
	6ET0IgigAiz3u67PapZj/x0go0UX6TZ356F9dgnfGs52mGRXonw45Dwy1wCBomF08J8AacJS62m
	PTwFPAgcpKaSTmnm7Ir28EggcdPmw7d0Sh/B143KhuCw+OL2++A/2XsfqvXvfZDSIBDAXyjkLkU
	IlltAo9Ir
X-Google-Smtp-Source: AGHT+IHyyJCsiABK+wwwJ/lgyfO1ls36ZQt3JXsVmvsivUDUtxpenS401D2LRtb8OdsmEgQFuXJjhg==
X-Received: by 2002:a05:6a00:13a7:b0:730:9801:d3e2 with SMTP id d2e1a72fcca58-7376d5fee6emr654299b3a.8.1742336475698;
        Tue, 18 Mar 2025 15:21:15 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711559269sm10478181b3a.65.2025.03.18.15.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 15:21:15 -0700 (PDT)
Message-ID: <0c6f23d5-d220-4fa7-957e-8721f1aa732f@linaro.org>
Date: Tue, 18 Mar 2025 15:21:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] exec/cpu-all: allow to include specific cpu
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-5-pierrick.bouvier@linaro.org>
 <35c90e78-2c2c-4bbb-9996-4031c9eef08a@linaro.org>
 <7202c9e9-1002-4cdc-9ce4-64785aac5de4@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <7202c9e9-1002-4cdc-9ce4-64785aac5de4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: a5nxkPZB36Zp

On 3/18/25 15:16, Pierrick Bouvier wrote:
>> This doesn't make any sense to me.  CPU_INCLUDE is defined within the very file that
>> you're trying to include by avoiding "cpu.h".
>>
> 
> Every target/X/cpu.h includes cpu-all.h, which includes "cpu.h" itself, relying on per 
> target include path set by build system.

So, another solution would be to fix the silly include loop?


r~
