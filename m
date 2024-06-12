Received: by 2002:a17:906:6a09:b0:a6f:1bf6:7fc1 with SMTP id qw9csp609008ejc;
        Wed, 12 Jun 2024 12:54:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:23c2:b0:704:1932:55ff with SMTP id d2e1a72fcca58-705bce2f56cmr2876279b3a.19.1718222081663;
        Wed, 12 Jun 2024 12:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718222081; cv=none;
        d=google.com; s=arc-20160816;
        b=dQEor1eGsCcAyexQh+mDwf+4h6V0b/Bxi+W9WJqarYF3fykae9fvQ+0KI8ZF8pTIpt
         NjxPNPmeS/tDoFg2vj6nmm5+kjvl3wmD2QwOOcrlgLQrlxfy2l6rVhPs0zm1RBkHtnnu
         k8jDDHB/CKmad1qezSxatVyauqT6Vk94x5UdIgQZWlv6/8bdqiRrQU66suPRvkGYhPNQ
         azb7VDXWbZLhe+W2EcLU++BYdWrDdhQfDp2iu8oX2BLe1Z8NaCbW4LI7IWA7HiGsQE+Y
         jwtGTwZj+aiimTIxnYbSmTW+80DkQBb/JwuLdog3KmJrmfKLLYoAA3962WUCWv2JM5rt
         S5Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=014mCvmsneMMkuLx+Xyiw1WdgpnbnmCM9FvWncbYNgI=;
        fh=WdO/MgZAJD1aMd/mwBHdD3J1udKuUGFkYpPcQXYoQ40=;
        b=CsT0QoPkPKLL3UA7Wmo+nGAaAjOlhoff3ukyoUGyohf8h61x5Mta1AAE62nr152ZPo
         fyGbj3gKJUGmSWR5F0NJnMURIzhU6/vmFv1CS4rDikF5ENjbaXcr/Com2+wXwGmGlq6n
         ufHgEj/wakVNxfYlhCvyBvu3YaY+e5fR7kVKz1IkQPPXJaHIIi3TN0QdIra/I7nJuucN
         BLiMKio6QMTl7zt8tUcXcgs6p5hJZn6CVgVDPcBEomT7kn1ojlvzNZzplA7Tu7N+8BPx
         DMDtWWqBGTWMxN746Dj/r+PJ/edpSIPZQ/gt9gdhaBs+10KRb7RCI2VWIO3fJnOA8wc1
         ggJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PlvE35YN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-70424671c13sor5694108b3a.6.2024.06.12.12.54.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 12 Jun 2024 12:54:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PlvE35YN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718222080; x=1718826880; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=014mCvmsneMMkuLx+Xyiw1WdgpnbnmCM9FvWncbYNgI=;
        b=PlvE35YNz8tWmbUMu7gPpQIUOqz0F6GQpFHI6qpilyI31DZ0fNUlZrgyUzDxDzfFuD
         aDQe0GlVFyT3IDnQRHeq3Qg2v3y70dam91imcc7HOAH/sfxyOxNnJzQqm0pqrTMlrOvM
         MFaHvgvL+ZU3bz9Pa/H+ew+EMnh+Lcbm/C44mQ4zI/2UkYPSNSMFB8EMqz3WORAhMEG0
         xuy6Y9UOy4KkrOjhjHpWfAk60UHgG0rTiVVqzLoK83JQxQASAB2rf+Kj/UXvFZketFDi
         4ntWaLpkxpC5aLrta2hrItVNqQ7zX0OvCQoAX/N2/ZvvappVMZFOvYuo6ZLB9QMmbgRP
         5lmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718222080; x=1718826880;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=014mCvmsneMMkuLx+Xyiw1WdgpnbnmCM9FvWncbYNgI=;
        b=c5xKd0yHTcm62ZaFriVs5a1UKmD0Rzk9Kv4VrU68wyjAZRl8g0kHwkW8CLWFlokcjD
         sFlOhoNqKfEfr+ItyR4SZNCDsgPNnEp6GIQq3DJrI4iensJ8wHeViAysm5aDC7LWzZj/
         gJjv4yLPk4MQn4MAP25JXwGmZ0s/AYgjX4Up1kSMFbToYuz23RiTkHAEYjHUrxDdX0eV
         Wp/ieyGykQXE97EhYwqRXuQpTlt2i5S+vqFfpKOFZV9yMZttJbX7wEaB/Thl8slmNk7I
         LRJ7vrjZ+Se2pu++4LEvGK/9XJDen68uz+D36BN4DR+0ajbdMq7VHm09yO6s32MfGJSS
         2yMQ==
X-Gm-Message-State: AOJu0YyFtqG7hUUMFTezVs+r1JVxWLK5PTsl5LKcmMFWzZnWg8vtXhVe
	BIOaOcCJkO/SrAbwhhxxfKn8vQMFTfdcsDIpwUVow2lGpKLvNdHp9LRp7VFYj+vUtigDN/ovjXM
	iqS4=
X-Google-Smtp-Source: AGHT+IFiZMLDHj1AGhVp8Sgaq2CBrQxTQCF/xc8ZKCR3TczAc73j+H0Z3wRTa2yTgiR8xyhFeQrcYg==
X-Received: by 2002:a17:90b:2250:b0:2c4:b300:1b4c with SMTP id 98e67ed59e1d1-2c4b3001d74mr1876019a91.24.1718222080434;
        Wed, 12 Jun 2024 12:54:40 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::2193? ([2604:3d08:9384:1d00::2193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4a7602690sm2256310a91.28.2024.06.12.12.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 12:54:40 -0700 (PDT)
Message-ID: <ec9ded4e-4a06-4472-84fc-1942010b34c8@linaro.org>
Date: Wed, 12 Jun 2024 12:54:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] plugins: add time control API
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Burton <mburton@qti.qualcomm.com>, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Laurent Vivier <lvivier@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-arm@nongnu.org,
 Alexander Graf <agraf@csgraf.de>, Nicholas Piggin <npiggin@gmail.com>,
 Marco Liebel <mliebel@qti.qualcomm.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, qemu-ppc@nongnu.org,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Cameron Esfahani <dirty@apple.com>,
 Jamie Iles <quic_jiles@quicinc.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20240612153508.1532940-1-alex.bennee@linaro.org>
 <20240612153508.1532940-9-alex.bennee@linaro.org>
 <abe88b9b-621a-4956-877d-dd311a7fd58b@linaro.org>
 <87ikyevtoc.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
In-Reply-To: <87ikyevtoc.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: wdH0s1XnDxNS

T24gNi8xMi8yNCAxMjozNywgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBQaWVycmljayBCb3V2
aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+IHdyaXRlczoNCj4gDQo+PiBIaSBB
bGV4LA0KPj4NCj4+IEkgbm90aWNlZCB0aGUgbmV3IHN5bWJvbHMgbGFjayBRRU1VX1BMVUdJ
Tl9BUEkgcXVhbGlmaWVyIGluDQo+PiBpbmNsdWRlL3FlbXUvcWVtdS1wbHVnaW4uaDoNCj4+
IC0gcWVtdV9wbHVnaW5fdXBkYXRlX25zDQo+PiAtIHFlbXVfcGx1Z2luX3JlcXVlc3RfdGlt
ZV9jb250cm9sDQo+Pg0KPj4gU28gaXQgd291bGQgYmUgaW1wb3NzaWJsZSB0byB1c2UgdGhv
c2Ugc3ltYm9scyBvbiB3aW5kb3dzLg0KPj4NCj4+IEkga2VwdCBhIHJlbWluZGVyIHRvIHNl
bmQgYSBuZXcgcGF0Y2ggYWZ0ZXIgeW91IHB1bGxlZCB0aGlzLCBidXQgaWYgd2UNCj4+IGdv
IHRvIGEgbmV3IHNlcmllcywgaXQgY291bGQgYmUgYXMgZmFzdCBmb3IgeW91IHRvIGp1c3Qg
YWRkIHRoaXMNCj4+IGRpcmVjdGx5Lg0KPiANCj4gU3VyZSBpZiB5b3Ugc2VuZCB0aGUgcGF0
Y2ggSSdsbCBqdXN0IG1lcmdlIGl0IGludG8gdGhlIHNlcmllcy4NCj4gDQoNCkkgcG9zdGVk
IHRoZSBzZXJpZXMgPDIwMjQwNjEyMTk1MTQ3LjkzMTIxLTEtcGllcnJpY2suYm91dmllckBs
aW5hcm8ub3JnPiANCndpdGggdGhpcyBmaXgsIGFuZCBhIHNlY29uZCBmb3IgaXNzdWUgcmVw
b3J0ZWQgYnkgUmljaGFyZC4NCg0KSWYgeW91IGNvdWxkIGludGVncmF0ZSB0aG9zZSBpbiBj
dXJyZW50IHNlcmllcywgdGhhdCB3b3VsZCBiZSBwZXJmZWN0IDopDQoNClRoYW5rcyENClBp
ZXJyaWNrDQo=
