Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1192930njc;
        Thu, 20 Mar 2025 12:37:05 -0700 (PDT)
X-Received: by 2002:a17:903:244a:b0:224:1af1:87f4 with SMTP id d9443c01a7336-22780d8f6b6mr8066075ad.22.1742499425268;
        Thu, 20 Mar 2025 12:37:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742499425; cv=none;
        d=google.com; s=arc-20240605;
        b=Oizv4ThgkPlZ5nq6aZb9k0k6phqt/P5gyHjYAArj4LLRX2aR0VGOHsNwxMHMvx5V0/
         YQPEoRH4rOz/5u28oLKfJlUz1r8DrczMwY29FDFf0w5PgZexoHQB4RHOKNN0/NPn9YAQ
         tL8k3OO+Oh18yhP1R6xHkcBw9nMrEOjuz7z/Ql4EmFNF3AmkCw/OeN+6NDsR9wZopQ/8
         nFO/8D0AjFl3ouwaYBdyDlZ4UuX4sVc5TphkaHRZxS5gJLHEHQcBoxPzdnzYnMC9EdGJ
         s3Pjsp1vgNKj7A+qKzRUwaVcxtdRjyEkDZCMY5GuQQ0A2SqxealJ+IMMvN4QEjGx/zY+
         h4xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rDZynczGmYKcos5/gHlvWtMBvIJwWjWcZ9dirhIBp64=;
        fh=EhMBeZB0kaVgKHqiTKwkIbzSpyIX4IfWsATf26EX9uw=;
        b=X7J5syo7l+yK7lvQ5idY7Xe3tb97zPRzmstl6hNDAE/FDcDr8NWKe9pRGWTYQ0J9Rj
         yQes8DPBT0ZydZKkvJAbSWaAwpVfVAxoHEfVHO6c7TtM9B7znA0+Nw9Ag/91WEy/T/9U
         7ox6ZfwqxCfv07JwgtPW7VCXGcexbg0U1lHhTF2cwDuOCDw36WhaTOaXuYlwJX/yu5y8
         +VSM4smptEXplve554hU+16czxFJ3qgeDWpleCqNYi0UIY0c48sgRC6OcBjLB2qIY5MH
         llfjLsWzLe2r7/c/uu8r4hm/sQICA08SYXE40mKlqSpl0EHv/RT8VYf9mmzvsazNhJE6
         kWpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X7AmYnHp;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f8f3ccsor2164235ad.16.2025.03.20.12.37.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 12:37:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X7AmYnHp;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742499425; x=1743104225; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rDZynczGmYKcos5/gHlvWtMBvIJwWjWcZ9dirhIBp64=;
        b=X7AmYnHpEdXNExRVcVe3XJ3QXe4yRyshLdpkuHk1v93Hzm7lGyIc8X4u4G0gF5NJIr
         kbstkCJtmx6tOilSTixM8FsxR46MNvqejGrMhNN/rPxnk24Bdgu3nNXIWdVK2gS7J6JD
         YGtBgKV2eegz/9SXyxsdVr+tL8uB3QLFQO0T2t3eL4rxe3kDaUeJBBgANa7UwJPR7yu8
         TVEv9v+g+gkQogoJU1vNKrf46e28R9uYUMf5nLfV//x9IZPQIwEkwu7dmtYWNW4prWBe
         4vkUSpQOhByqkyA92KmtMXi3WNAh/dyHItriA1Bm9VUkXdLLkr/0UwJqOtdlyaPZ6g+c
         jNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742499425; x=1743104225;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rDZynczGmYKcos5/gHlvWtMBvIJwWjWcZ9dirhIBp64=;
        b=e5Ds9ECPJx4m9+Ma+rh8w/h4MfHFSRy1d2Y2KiLMuk77YFp64XYr70YfHekVeAfK0B
         JccfyAnYM5FvCBlNxLq44GJTqyiyipDbeQKxtCnnuFFk0QJ2Ky9l7XUlL2K2v9wdr7+j
         XY+cFGcSFeOqNqZAuRhMOoSUVf0ei37YWaDLOXh7KVfnSf7G50q8Y1qFRcoHp3DU8t/N
         eGdTTMcRULMeKnQJTk0cX17Q/9J6hfok2DU0XhyKzQysU7qh75cAjDWRVI8tL4ZU/8pg
         k04qqrMb2WMSv6BaEW7f8xMTHxY+VXtyIJEhxyleLfwI1GxVQqvascxS7nWb7XL18Ucn
         VlBg==
X-Gm-Message-State: AOJu0Yy7GolC4iaSlE2j0yg7hJKRNtQTrMvYvTqDqnW4Isavn/S08n+s
	mWte+7aERUe279PilqEvn63hFOBk+glvM3YCpXJFwLo+B/YN0HFcFUXWu0kgZLLUjU17aBfroGT
	GUl0=
X-Gm-Gg: ASbGncvMfS5ueCYleWF4IXnB2ejS7LrL1UeAK1fyWZIVyWb3gUw2pHtPHKGpo/f1Ffp
	sCQIzVr1WaZYSTLOFkOAHi1D3QzFrwql1WUXo11eM/O5IWZIwJofZgdm9uQ1iwYmEs8Mc2wJemN
	egkQLxhyxmQmilpZ88KX6lQ8zaHItff2i/WNSRfBwy9t/mhdLvkYwfY7Cq0efbfFtfzLaxfBYQB
	p5WOlKhbgSZk9sqFd5fMRQHjYMZ/m/YZBGxthpFDxKsRUL4+wb7ecUQ46oTeHTa+R8pdK2XmUW4
	fU3r/bUaNhci61PjGMbXNiwqOkkDvpDnhP7QTMbgaLusZ9z2nba6I4pJmA==
X-Google-Smtp-Source: AGHT+IHs5e3rSO7j7v6qa77hnKJSY9N7Ot7ICPFp6kuHOGqbiXXF3V5Wbzpk20ZeKnp5qzTqX/BUXA==
X-Received: by 2002:a17:902:d488:b0:21a:8300:b9ce with SMTP id d9443c01a7336-22780e2a48bmr7776605ad.49.1742499424885;
        Thu, 20 Mar 2025 12:37:04 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811b80cdsm1732055ad.129.2025.03.20.12.37.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 12:37:04 -0700 (PDT)
Message-ID: <40345494-3bfb-40c2-8837-75bc410361d2@linaro.org>
Date: Thu, 20 Mar 2025 12:37:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] include/gdbstub: fix include guard in commands.h
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org,
 Greg Kurz <groug@kaod.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
 <20250319182255.3096731-2-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250319182255.3096731-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: 8BMxdXT1w6cB

T24gMy8xOS8yNSAxMToyMiwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBTaWduZWQtb2ZmLWJ5
OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgIGlu
Y2x1ZGUvZ2Ric3R1Yi9jb21tYW5kcy5oIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZ2Ric3R1Yi9jb21tYW5kcy5oIGIvaW5jbHVkZS9nZGJzdHViL2NvbW1hbmRzLmgNCj4g
aW5kZXggNDBmMDUxNGZlOS4uYmZmMzY3NDg3MiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9n
ZGJzdHViL2NvbW1hbmRzLmgNCj4gKysrIGIvaW5jbHVkZS9nZGJzdHViL2NvbW1hbmRzLmgN
Cj4gQEAgLTEsNSArMSw1IEBADQo+ICAgI2lmbmRlZiBHREJTVFVCX0NPTU1BTkRTX0gNCj4g
LSNkZWZpbmUgR0RCU1RVQg0KPiArI2RlZmluZSBHREJTVFVCX0NPTU1BTkRTX0gNCj4gICAN
Cj4gICB0eXBlZGVmIHZvaWQgKCpHZGJDbWRIYW5kbGVyKShHQXJyYXkgKnBhcmFtcywgdm9p
ZCAqdXNlcl9jdHgpOw0KPiAgIA0KDQpSZXZpZXdlZC1ieTogUGllcnJpY2sgQm91dmllciA8
cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0KDQo=
