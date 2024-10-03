Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp1537943njl;
        Thu, 3 Oct 2024 09:04:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWziXlxRp09Zz7dFj6sHvp5oV0GSJ6ovfQeFBV604deNs2vwoNo5P5O3qMXq0oARdUqD5mLibl3ZLvRiw==@linaro.org
X-Received: by 2002:a05:6a00:2e1f:b0:718:d8dc:308a with SMTP id d2e1a72fcca58-71dc5c6710fmr11747813b3a.12.1727971489817;
        Thu, 03 Oct 2024 09:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727971489; cv=none;
        d=google.com; s=arc-20240605;
        b=dlBPTuSUM4uI55bMelAEB2XpTZQkUvdYbYBmOvcIPOb++IM7W49NdQ4Eni5AseLpcP
         qYqetmf4TAQIMX2eIQiM1YEpyuR7c8pszkc082hg/ggsp6OcYoIkH/9EPXiBDY0iapJX
         UaNzuUcfeKv9DTcLJVAcV9m6KjV2QLfF2rfZzOzQb5T58XFsSOpHZOZ4OqPBQKPXZTdK
         ta4B0k0A54+JXQ5ERVMDcahu41c3N5xnrCraC4mmFM/yh6ps25QYustVZX9z5zlXkO1j
         RVeZ47rXyXE/ideiLbB+FA9nR8ar/F0L1KGjrKvysFhkqceg0NHHSHTl8/EJMv9RqUdH
         ddJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xd+KNlJuRhKfKfKDoqr+1HcJybPz+EG5VXk0CLeGvz4=;
        fh=If8FdraYtKC5R/y78Cd8ahyxqnBAtr99PF5DwYFL4rk=;
        b=krFpwb8w/Vk7c6VWD09R1910ngv/fkLneSC9Pgxaf0FVxK//gHacgwjb+TcZhTLZx+
         LtWTPhVQrXHA98NMS+44Va2gjmgGuzfB7XGiaMmCe3oGxUZ86qL1TYxRyeQRUYvAHiem
         Ih8UiLYf4sZ0jFWG2+nVGdyfa5lDns3z/obVgdmSOUlVTYGLehIKCDO9yOeewd6hUZH4
         pcjxjXaQ30av+CCZJ6PjYScFCIHBkuaDtd03hyEM4zSo7F31p9DqZ6ackLD3hSXfYwg2
         6bQA8R0dbg130SfQHRRJwyPnhGXAMocIQBkGxO8+F3HFqLu3zte5ILafeXQmMF0Immty
         BxnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KMODCrR7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71dd9debb96sor1257820b3a.9.2024.10.03.09.04.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Oct 2024 09:04:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KMODCrR7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727971489; x=1728576289; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xd+KNlJuRhKfKfKDoqr+1HcJybPz+EG5VXk0CLeGvz4=;
        b=KMODCrR7Lm/3htJO+D/PqTG8Uk0lcSxNFW1qgQKw7RR7OTqhSW5JyPCWDCsC1BlrPV
         egJTJzSXJ0CQs2HuKnzvOsXqWx8g6FYAJPQaoC3rOf+RK6dJroLqoUhNKCkE7V0a4fuJ
         tiw1jkwFEwQUXlJxt8Op1+fRyWA7Ku9FRoFrTdZGRmIVWppNkK/icVe4Mh5gu/ujBSUk
         q7DM7lJQHqH3/DP+zQI89Gb8J3x/ngKVuZssIrcHbgNevqd3qkbP81UeO7BkQ5Vlt/T9
         8TvX+QaFAYZdoM3wim2X42bkgNr5GdUARy2Aj9kiRDgJg8GjUIQUzAZS3cu8TbCKzB6S
         luNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727971489; x=1728576289;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xd+KNlJuRhKfKfKDoqr+1HcJybPz+EG5VXk0CLeGvz4=;
        b=Z1f+gRQtGri+FQ0SdjfW3XUsRS5GKl/eb9iy2u01F1cgwXvpgM3zxGezuHpF5gmo8p
         ysY2kcBc+2llEkkaNBTjLs+zawT724cD2dNCf7KRXsD/A4J+IS5/cUbZ1+c9u40zM8BG
         GX14LxhVEP2hjClYwOCmdchCIS26Hr37wel8ZhrjRp0dloqnBGZ3UWwjUn200lsETUbD
         qbDD3WXtExV+UOW1e1WUGGNijNSIcNA12Dk25m5O8pPtnf2LyDaz5ZQPm55b7Biv7p2N
         OXpTuVlNsDOVGdx10v/zvfCbed5Ak44KuIbz6eWtM+Sl0UioFkJbB/2S0euViWWjy3hR
         TwgA==
X-Forwarded-Encrypted: i=1; AJvYcCXLSMMx4u/EZYVDHsUBLbHqKPlNLPNWpMzOB43PAepM1jUVlqWp1Mndh/NT4XkFHTceHFoi9VVKG+dpog==@linaro.org
X-Gm-Message-State: AOJu0Yyy+3+lHSzgJyo+42kUO9Ii8f0t+JZX4qqBUZeD6lhaik8lo6wa
	OJYi7DZUV+FnONZQxCtYNcxIQJxc+BPi/Uht13vt6VrO8/M3cH97ju8BV9NMSvcncg==
X-Google-Smtp-Source: AGHT+IG9uo0HFqaGmZMevXzzrKkIrORLN6T3Ly0QJzV4gHFsGlE0SCtgdR3x6pyILKVijdlvhnGYZQ==
X-Received: by 2002:a05:6a00:b50:b0:70e:8d35:7ba3 with SMTP id d2e1a72fcca58-71dc5c8f187mr11052700b3a.14.1727971489290;
        Thu, 03 Oct 2024 09:04:49 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d8bfefsm1502244b3a.52.2024.10.03.09.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 09:04:48 -0700 (PDT)
Message-ID: <a14cd43c-087b-4a5d-b036-39aa6a80e691@linaro.org>
Date: Thu, 3 Oct 2024 09:04:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] hw/xtensa/xtfpga: Replace memcpy()+tswap32() by
 stl_endian_p()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Jason Wang <jasowang@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>, Huacai Chen
 <chenhuacai@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Sven Schnelle <svens@stackframe.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-arm@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Burton <paulburton@kernel.org>
References: <20240930073450.33195-1-philmd@linaro.org>
 <20240930073450.33195-9-philmd@linaro.org>
 <257b0de0-6744-4ae8-a2c5-f05eec29a3f0@redhat.com>
 <0c28a435-0af6-450f-8558-14dddc6cb6a6@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
In-Reply-To: <0c28a435-0af6-450f-8558-14dddc6cb6a6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: fPlZEldwQUxC

T24gMTAvMy8yNCAwOTowMiwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDMwLzkvMjQgMTY6MzIsIFRob21hcyBIdXRoIHdyb3RlOg0KPj4gT24gMzAvMDkvMjAyNCAw
OS4zNCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+Pj4gUmVwbGFjZSBhIHBh
aXIgb2YgbWVtY3B5KCkgKyB0c3dhcDMyKCkgYnkgc3RsX2VuZGlhbl9wKCksDQo+Pj4gd2hp
Y2ggYWxzbyBzd2FwIHRoZSB2YWx1ZSB1c2luZyB0YXJnZXQgZW5kaWFubmVzcy4NCj4+Pg0K
Pj4+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGlu
YXJvLm9yZz4NCj4+PiAtLS0NCj4+PiAgwqAgaHcveHRlbnNhL3h0ZnBnYS5jIHwgNiArKy0t
LS0NCj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9ody94dGVuc2EveHRmcGdhLmMgYi9ody94
dGVuc2EveHRmcGdhLmMNCj4+PiBpbmRleCAyMjhmMDBiMDQ1Li41MjFmZTg0YjAxIDEwMDY0
NA0KPj4+IC0tLSBhL2h3L3h0ZW5zYS94dGZwZ2EuYw0KPj4+ICsrKyBiL2h3L3h0ZW5zYS94
dGZwZ2EuYw0KPj4+IEBAIC00MzgsMTEgKzQzOCw5IEBAIHN0YXRpYyB2b2lkIHh0ZnBnYV9p
bml0KGNvbnN0IFh0ZnBnYUJvYXJkRGVzYw0KPj4+ICpib2FyZCwgTWFjaGluZVN0YXRlICpt
YWNoaW5lKQ0KPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzaXplX3Qg
Ym9vdF9zeiA9IFRBUkdFVF9CSUdfRU5ESUFOID8gc2l6ZW9mKGJvb3RfYmUpDQo+Pj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6
IHNpemVvZihib290X2xlKTsNCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWlu
dDhfdCAqYm9vdCA9IFRBUkdFVF9CSUdfRU5ESUFOID8gYm9vdF9iZSA6IGJvb3RfbGU7DQo+
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDMyX3QgZW50cnlfcGMgPSB0c3dhcDMy
KGVudHJ5X3BvaW50KTsNCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50MzJfdCBl
bnRyeV9hMiA9IHRzd2FwMzIodGFncHRyKTsNCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBtZW1jcHkoYm9vdCArIDQsICZlbnRyeV9wYywgc2l6ZW9mKGVudHJ5X3BjKSk7DQo+Pj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWVtY3B5KGJvb3QgKyA4LCAmZW50cnlfYTIsIHNp
emVvZihlbnRyeV9hMikpOw0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0bF9lbmRp
YW5fcChUQVJHRVRfQklHX0VORElBTiwgYm9vdCArIDQsIGVudHJ5X3BvaW50KTsNCj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGxfZW5kaWFuX3AoVEFSR0VUX0JJR19FTkRJQU4s
IGJvb3QgKyA4LCB0YWdwdHIpOw0KPj4NCj4+IFdoeSBkb24ndCB5b3Ugc2ltcGx5IHVzZSBz
dGxfcCgpIGhlcmU/DQo+IA0KPiBXZSB3YW50IHRvIHJlbW92ZSB0aGUgdHN3YXAzMigpIGNh
bGxzLi4uDQo+IA0KDQpJIHRoaW5rIGlzIHBvaW50IGlzIHRoYXQgeW91IGNvdWxkIGRpcmVj
dGx5IHVzZSBzdGxfYmVfcCwgaW5zdGVhZCBvZiANCnN0bF9lbmRpYW5fcChUQVJHRVRfQklU
X0VORElBTiwgLi4uKS4NCkkgZG9uJ3Qga25vdyBpZiB5b3VyIGludGVudCBpcyB0byBtYWtl
IGJlL2xlIHZhcmlhbnQgInByaXZhdGUiIGFuZCANCnJlbGllcyBvbmx5IG9uIGVuZGlhbl9w
IHRob3VnaC4NCg==
