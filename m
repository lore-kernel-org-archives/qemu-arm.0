Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp564285njc;
        Fri, 21 Mar 2025 13:11:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXnJ2DzVLPJyUMzMkCdGRZ/dfPtFLoyioWtHLBPsLhGu3f7Gq4Jd0lD1NeTSFx2eUYbNhIj9Z4EZrqPkQ==@linaro.org
X-Received: by 2002:a17:903:320d:b0:220:bd61:a337 with SMTP id d9443c01a7336-22780d8ceb5mr77480095ad.23.1742587898920;
        Fri, 21 Mar 2025 13:11:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742587898; cv=none;
        d=google.com; s=arc-20240605;
        b=abhILKA2yD+F1RdOrMoZbO9Br8yqRxj+r5ci1s/Y7HsU0uG/9tglCOTEAnF/KEvg+n
         Nh/4pkPH0w78ZgLowJRs/y15kp8ODXxMFbnLYvqVVWqPjupVMX9NqcABrEoveiyhkgFh
         04/pa7iOMQzmdic+lTmBKTXiBCid/v+amb5FtuG/2QyFWZVeLo+GptRB/Y24RbwsH5OD
         yXFwLvlxJb0ZOi1NMnNHVmWp95ivrhZyxHq5koJC/LMhdK/qRpIDsOF75rSez6Pxbvpl
         TGRGNGRdQ4V8N8JTzbY/MrzjL66OqAg7cpfJjgPpmzNPXXrvXSE6KGaXStmVOzNzAUdv
         A1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6T+1x5xOuQ2yJ3mt19MuTaHImZYpr22igEe7u5TyWMg=;
        fh=eT6mjzvXGHG1lSBHnr1yeXIF5NKVkkXV4ss1dNgnwJw=;
        b=Ja/VHGUXNX3kHyClPfnM9ZGoPI/cYeL7KH6CXJ/KzkcO97DS1XiQovVhkYOokhNoPM
         Hum66ngo+aLVPCVtzJrIk215I60pVZsTcS7TWiLrKBnbNc2getr2TNJLGSvzq6eDRWvM
         Zj4TvI1fSWsfBlzVRG/HOFijCTIUa3ps7N5ar93zbm2tLcKNgxqhleoHC0taWbLFlsKt
         YZ7/uLHVfT9P61HBXtoE9raoN8pLQFREqOWtCZXbCGS3qfVyb/EFPB3+PvQ9Mggkoj12
         1M90IvhOPxmoY31dIrb0PLCqMFQQ7IaDbwvYDnlYeVQXHsteqhhN0xh14s25l2lQ09WV
         EwhQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nJ96z82V;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-227811d1fc8sor20017035ad.15.2025.03.21.13.11.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Mar 2025 13:11:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nJ96z82V;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742587898; x=1743192698; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6T+1x5xOuQ2yJ3mt19MuTaHImZYpr22igEe7u5TyWMg=;
        b=nJ96z82VwZCwTyuOacUR25Agz29oBs1/Wp/V60NBVaBvyDpOs2d+jBDb/7jvkNIoso
         zgABHVd3e7LTEVH85OCEBsxpG9BAYgKexoIFasOKiLUY4TwZH24bGboImd5fIt2HFVot
         prg8XTl/jIMTcvOc5RRK9oElkn71ip2ZazE1GFDQFU1M18vrCuZV/skPuG0pKTkn3bHZ
         j8Gj7NWnllLjLtSsORFG85CCgCU7rwNYf40oZaThwwBABIkvXfA5KvZGeflD6KE0NPZC
         QBbMni2I27h+2YgwnmAYe2tHZxqg7zWSMWYnYs9NsNOFuotTXyI1Jgnei+CiAoLKrb3F
         cHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742587898; x=1743192698;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6T+1x5xOuQ2yJ3mt19MuTaHImZYpr22igEe7u5TyWMg=;
        b=tCLSSW4NDHBSsAS9S+JAXvT1KrbC4S7LvhDO1kc5z4uuVE4XkUYoD8UVH/VQEf3po3
         RiLYLuO23YElce4xvE20F6Snyzm3ezVim+ypB2Sgs1UKRk/exJ18OReckmUow2AmFTlF
         XZbs0OHNGzgBGO+Fu4FDIqDZ4QCsTs+XNFjqinPUpjlT8jEFmREu/lWt4lAr+vzVX12i
         M728fPRfxTwIv30hnIfSKtk3oGxwjmtcYG1JkWMyexqe8duoPmlxoRCnlNxEg7QA7WyB
         SWEo0w+J9Bc9M9oG8V/Vmy9rtSKi1k88SjMb7TbQYJTbdqJTzu0aAt0T+lVRqk1EK54u
         rdlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRkWT1qb/slKj2a5MFRxr9M//r23h/R+ZsyWF6fYyYWOsx/nYGFYWoUZ3b36EPiyzZnE4+ItCCkbCEpg==@linaro.org
X-Gm-Message-State: AOJu0YwrvtjK+c/uyq9BRyuYTIQHkJIFbrLp8e/Y9GgRjzcTSj+8D9KN
	syYknZWIoG0W1Brl5l7A1/9nw9a5Gx6C6o+bTMbmD4g3+fpajKav627pHGquPwXQ+g==
X-Gm-Gg: ASbGncsfYyi378DQoKEGttCmXYXxnnyI/7r5jcW6tYk74qvZQPtgw3s9d8dzPcKy1dG
	42nt4wZQVHvCj/oYdOhed3yoXmjYUPNWs26B/+bviR/I7+74slFOmYe83FhKieQpdNF/6tsvDxb
	Dh6o0iZ6thMEtfy9L4mGlzaQaUm5T2vqPvS8f1RAcrMLlCxMqdEMGkYycjRdKA++Ya3EPruDsag
	eyNIzsJonpaYZi3lZ7oF/S2if4OzioI32o7hNMRqODDmKxhqdIzAglPV6wesKuQrwG30mW/RNmg
	LzveuXJ21DwpYZpXknQAfiBQtE4osfn0wN/GLjWMkcdy29Tp8QUpt8lEuHWDRPINl5htAA==
X-Google-Smtp-Source: AGHT+IETv1gtDe0Tn14WdsrX20MpKLXdC8E2l3VUaPRnXb98rd0gWl5A1Eo5BTcwdnWAcDxnvNIVCQ==
X-Received: by 2002:a17:903:32c8:b0:224:1609:a74a with SMTP id d9443c01a7336-22780e14a50mr77491965ad.34.1742587898418;
        Fri, 21 Mar 2025 13:11:38 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [172.16.224.217] ([209.53.90.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811da89csm21677065ad.193.2025.03.21.13.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 13:11:37 -0700 (PDT)
Message-ID: <216a39c6-384d-4f9e-b615-05af18c6ef59@linaro.org>
Date: Fri, 21 Mar 2025 13:11:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/30] exec/target_page: runtime defintion for
 TARGET_PAGE_BITS_MIN
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-18-pierrick.bouvier@linaro.org>
 <2e667bb0-7357-4caf-ab60-4e57aabdceeb@linaro.org>
 <e738b8b8-e06f-48d0-845e-f263adb3dee5@linaro.org>
 <a67d17bb-e0dc-4767-8a43-8f057db70c71@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <a67d17bb-e0dc-4767-8a43-8f057db70c71@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: fDJanpGTVzS5

T24gMy8yMS8yNSAxMjoyNywgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+IE9uIDMvMjEv
MjUgMTE6MDksIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+Pj4gTW1tLCBvayBJIGd1ZXNz
LsKgIFllc3RlcmRheSBJIHdvdWxkIGhhdmUgc3VnZ2VzdGVkIG1lcmdpbmcgdGhpcyB3aXRo
IHBhZ2UtdmFyeS5oLCBidXQNCj4+PiB0b2RheSBJJ20gYWN0aXZlbHkgd29ya2luZyBvbiBt
YWtpbmcgVEFSR0VUX1BBR0VfQklUU19NSU4gYSBnbG9iYWwgY29uc3RhbnQuDQo+Pj4NCj4+
DQo+PiBXaGVuIHlvdSBtZW50aW9uIHRoaXMsIGRvIHlvdSBtZWFuICJjb25zdGFudCBhY2Ny
b3NzIGFsbCBhcmNoaXRlY3R1cmVzIiwgb3IgYSBnbG9iYWwNCj4+IChjb25zdCkgdmFyaWFi
bGUgdnMgaGF2aW5nIGEgZnVuY3Rpb24gY2FsbD8NCj4gVGhlIGZpcnN0IC0tIGNvbnN0YW50
IGFjcm9zcyBhbGwgYXJjaGl0ZWN0dXJlcy4NCj4NCg0KVGhhdCdzIGdyZWF0Lg0KRG9lcyBj
aG9vc2luZyB0aGUgbWluKHNldF9vZihUQVJHRVRfUEFHRV9CSVRTX01JTikpIGlzIHdoYXQg
d2Ugd2FudCANCnRoZXJlLCBvciBpcyB0aGUgYW5zd2VyIG1vcmUgc3VidGxlIHRoYW4gdGhh
dD8NCg0KSSB3ZW50IHRocm91Z2ggdGhhdCBxdWVzdGlvbiwgYW5kIHdhcyBub3Qgc3VyZSB3
aGF0IHNob3VsZCBiZSB0aGUgYW5zd2VyLg0KDQo+IA0KPiByfg0KDQo=
