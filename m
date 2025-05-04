Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1978435njj;
        Sun, 4 May 2025 08:52:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUiMF23tvZydQDntpAonh3OAo9ISeVLYLXRoPfRHyySfN+NlxCSQHa28u2iKtNc0ksxHZmnnybEW6cT1g==@linaro.org
X-Received: by 2002:a05:6a20:d48b:b0:1f5:86f2:ba57 with SMTP id adf61e73a8af0-20e978cab74mr6133615637.30.1746373926431;
        Sun, 04 May 2025 08:52:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746373926; cv=none;
        d=google.com; s=arc-20240605;
        b=ezS/Bua1OPXjtlPzj+DrxiOpWIG2xsIXlL/Hv4D76n7BKIIUE9HvQwiJmVPEwuDOUZ
         7d0iJsr9v5smVIQqKmkW9FL04lWtkggFQNFkr+vfyiR+Wr7JEgSNvcGzAafOtK5HsITT
         Ivx7QXqiRShbwqIYAOgrlfzs7WyGqUsK3CbeDIqlVMKjC8EgBok+dtcEex1eiaI8onXv
         5ipV+itINioA1Z0gYteaFUeZ+PBTg1KNfmAZVCkk8jXNdqS0owS00TyJpca6boJdSj7A
         pfYBZ/N5r+lE8mUOeSO3PAWJVb09PmlRff++fJI7DYEicjQsXyi1SA37GAOTS7ERRBul
         K85g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=FzJ7KBiUM62Kou2rvlVI27PREsZpJnLCrsZBTZ6Q1cs=;
        fh=R1dpSrP51+OgqSs0sKAoaTa/0/BMkyUDLos2ig5T1H0=;
        b=Z0Bs63rU8G3OtMqa84hUw/gxGTNKJeX643JK1qT4k1ig7oEnWMHkcwogeNMbY6vU/7
         YzTIPp1wfxaRUDW79pypvxSQ91jJ5/kDyyt2hEDF0L37NY+dfeg3eH7T7nFywPHnZRWN
         34G4FBSXAO3V9XE8v0coikKqmltIPNlkbGPq5JnK9XJddRhekpHTJxi/yrZhO7V4ylUp
         2FV//vUCHgj/i13Y5isTWKYClOwZvZX/H8q8tNnkkrSEQviCaMbMg8fv5DPGmJsQDolT
         f6hbzV90i+m2/thXY8npRD4wzUGSd038TwywlrSM1OINQLVlYy2qzaWf69SEBULepgVz
         096A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q0/QJiQ4";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404ef15290sor6150318b3a.3.2025.05.04.08.52.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 08:52:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q0/QJiQ4";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746373926; x=1746978726; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FzJ7KBiUM62Kou2rvlVI27PREsZpJnLCrsZBTZ6Q1cs=;
        b=q0/QJiQ4fuPo/ti4tzPaFvuwo0QXR+p3LMFUJew2zaC2OYZ16GESUYCblBff8eQSmm
         HrWVHKp/7dl9RxtZRm7BWYQIvY62R0EKHhqb/lPZb0E/qubNGEelFI0A3YGd2ZTd40IB
         ExL9d7NQpyRzpnDN1gnm72R9Vuls2gS9I6E6sTvg0AtbjpFvCTJ1BJQZd+onS3xA7I9g
         swvOAoCth/l3A8NwIe6a6/AioZuO8wnTnHjCw7tdEhqaOfxXqWcJ+dyM6RuBLPk2lsJe
         gGNRUokTumsjbKgfXnct/qGg+Jla3ok6lL/Mq/gruWZ12QEZFRNofNziXm75GD0rTuvS
         zGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746373926; x=1746978726;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FzJ7KBiUM62Kou2rvlVI27PREsZpJnLCrsZBTZ6Q1cs=;
        b=InS/Jj722UfJ6BXhQ29TwBqgzP7quyNaOZs9jURb/ovan6tXYryofsT4ftGW3mYQww
         B3mcY3U8chNGPsJtK6Qeml+eXvowaCA+YJUH3E69nGqUofHfr2Iy9DQxdIWmbIQarHCT
         CiA7Kj7oBMjARoj6fQpIDEfwzblcUZiJAf3ZyFURoKteB9li72TyDi2GPA+8NdJKrOMb
         brw/hmXIqya94cWdxr8IDdCr7p80ClpUYTqtXevTsZV14XHrvkki+8+FLoK4Qc48mRUX
         ee3EFDo4UtwY77lZrkmYrnltKVgF/N6+YceENteijPTqOZ056Sbbr++YCJcjwSveYdRa
         QkBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb6HAi6m66hpbOh7W8WzGvouwN1HTJocB1zI0vPn6+MakhGBmKy3mPI7K6OBSdIFurJmnlsRHaz5Uz7A==@linaro.org
X-Gm-Message-State: AOJu0YxXsusju+USu6FpGvQHqkGWh+13Env6qcjKa8yM3uhrNcnmP+lm
	lAXj/VeCfYJ3oL1OkWA8Sz2+EOw5JhkegV2GzE41F5iGQdmXl8rsNrWqLEBTpwIcog==
X-Gm-Gg: ASbGncsDo7ivCN0F/THPjh3vkS9D3HcsCAK6rA8lQaNMauexsDTZEHmrH8FZtArw33i
	QdoaZ4bw4Yy09m8olV+hAraK2f8KkMj9WcDAXLIMnC7dMqfubkruyjGzvQ0fVRXLrOTS2ogZEM+
	dek6LFqyDzJXGr3eEygNI3gfcJA1FaFdAR6ruyY4r7Qz/9hjaniTOsqqU4ddh2rELdFkujwWslV
	g+2vrAKPK3VMgDyQPMpRszXx5ySB0tI7rwjOJLHppJp6Jxm0DLqFt0rCoRGbZ7AjcoYT5uwCWm5
	VxV5Ha4bHeWm10GqG10ad16NSuw1GBVer+j4MhcjGPBJFtM5ikiTs5FUFrv2F6kicq5QnsfJ4R+
	iDfbZTKQ=
X-Google-Smtp-Source: AGHT+IFVnnGElWZWktJSHhHrK1YBadBJiOCAhPHj3KmwBboK7qXHH78eZTQ8uPZhXv/BS1Ff8Cq9qA==
X-Received: by 2002:a05:6a00:1c9d:b0:736:a8db:93b4 with SMTP id d2e1a72fcca58-7406f092fe6mr6000996b3a.2.1746373926019;
        Sun, 04 May 2025 08:52:06 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059020dd4sm5003693b3a.117.2025.05.04.08.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 08:52:05 -0700 (PDT)
Message-ID: <866305e9-1751-4264-a984-7379bce6358d@linaro.org>
Date: Sun, 4 May 2025 08:52:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 30/33] target/arm/ptw: remove TARGET_AARCH64 from
 arm_casq_ptw
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-31-pierrick.bouvier@linaro.org>
 <a6fdb501-438e-4591-b166-87c8dbd14887@linaro.org>
 <3ba2f0d8-ce65-48a5-a662-f2350903a5c6@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <3ba2f0d8-ce65-48a5-a662-f2350903a5c6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: GfL9BTkM5TYJ

On 5/3/25 15:48, Pierrick Bouvier wrote:
> On 5/1/25 9:24 AM, Richard Henderson wrote:
>> Are we still able to build qemu-system-arm on a 32-bit host with these changes?  It may be
>> tricky to check, because the two easiest 32-bit hosts (i686, armv7) also happen to have a
>> 64-bit cmpxchg.  I think "make docker-test-build@debian-mipsel-cross" will be the right 
>> test.
> 
> By the way, I'm usually using debian-s390x-cross for testing a HOST_BIG_ENDIAN build. Is 
> that the best choice available?

Yes.

r~
