Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1738591njb;
        Mon, 29 Jul 2024 04:54:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWU8stuQvvrzjIBol+DPaYEeMzyeN8OpELc16bgY6PaocJ6jztW8cLfQlXhVQ5SoVwgIBt4HZl9yia053dBrDEK+xS/+GeN
X-Received: by 2002:a05:6000:184d:b0:368:3038:8290 with SMTP id ffacd0b85a97d-36b5d073f67mr6177678f8f.39.1722254088513;
        Mon, 29 Jul 2024 04:54:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722254088; cv=none;
        d=google.com; s=arc-20160816;
        b=wCS5Q043bH7E/klO1Mc0SGQGK1SvWIcQ80lonOgVaUA70rLdvEGFXDizCLvZaSjrjQ
         GAWVI7+Z3j5KDnk/J7EZJ53hNCLtw03k0f+x3Y4Hg3iQanpqjbX37oirJ9UhnZCKbwvn
         Ed7s3eUCZG5iB6Z6cVFYzpl8IMAUGs3P9MTGymQmsC8QdLp1g8Gc9nx3QPaZP18+3U57
         Au4Qta88W+9JAqGfUbBvhSkSlgL9KPPZERHiG8mvTTMKGZyTKLFg98vR80eNA9l16poC
         lrHZPuAV4aUF0+UGbYaAlQs/iGCP/czE2kMAnRXD15ctgpeJYYSTQojIutExGRffTS3v
         dF4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+ui2GzqOyf53+BduT2bZbxvFiRlJThGLjySYkf4II08=;
        fh=n+BAZ3oDXevKYfA+JZbp4aIqsn+l2iA3YLK1oEpjtiU=;
        b=vFSb9ToQt53blsd3ZrGJ9cVYfaF9igZDwzFX4Ov23GbsvaU4sIiwW17jaySTkTXawt
         krNK27DSSP9CWjr1AgZi4LeduYdDd+RakEzbELu2eWtfPVPtSHTDoM4snSHJRRXgWnEL
         OSEMCfv67nFYIZ4NArpl+5S5plzw8lZx3mmcR74pSm0vygK/2l6xKj3Te6WoQQrYUUmY
         ypbspqYxTVD/ZV1WosZx+xY7V9+k2aeMN/itmuUBPFPlGEKJDTFmRiJVJ4wZHeGL9KcA
         wcnluP6/PoEYf4T1IQfwgX/sHlmu14yjt7Z+meeYmazzf0rqOQj91p4NSCz6Eq0C40X1
         4Hlg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cyAMwNOP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-428068c212bsor23943165e9.12.2024.07.29.04.54.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2024 04:54:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cyAMwNOP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722254088; x=1722858888; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ui2GzqOyf53+BduT2bZbxvFiRlJThGLjySYkf4II08=;
        b=cyAMwNOPDHGUIIKhv5qvksvZUm+51WbFhROXlPeU52H8TUiqVoOULMoSQNiw63F46H
         YUvAbxh/GJRR6BlJd2SgHyQi9uosDe0OqMFD/irDJDE1mwYwhdZx4uhfyYbrdORaLAWh
         bj2FCWdDAFbWL3tqn2s1/szf4pozpTMYiHjqodIKDs/YhI9cUIbW7vGLRFeWwsRtxCZh
         RMcvavtwN3jlQBZsgEO5UWvdmBInJPPHi4gButE3A6dq1z93znheAt2aDQ2NnlIjQyDB
         8y4RIEjrt9ww6SorqUhZv4Ol9KAmWyQiNQtPVnTwCxl0M24mIXLjvyKvdXesXeGoTl3W
         jvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722254088; x=1722858888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ui2GzqOyf53+BduT2bZbxvFiRlJThGLjySYkf4II08=;
        b=C8lyhfWXANisdORbm3inRCoeMiJaV+xN/EsBeaQD3grWKEoQre111ivAFUpgQpd5SC
         GuXwOeMhTs/FE7WpQlIETXJhK1h442xPitvOYpC1l5ag805AgdICXfH8y4FbOGmL+zjd
         R25shKdk+lCv4DugnZXgV1Lm8JMEBJ91OEH6LeohmYpGncSo1ZIQLukTHdTSwKgZajcd
         IR9KNicQhSm4JEWJC2fPzfLmGnmTqtojzT/YV1HRUFrWZIY4slmX6e7qG4Oogle70pSr
         u0mOuPgM5Ch1owtceqnLfM9wAaN5ZhcIVGfgbV2YrxdCJSXPNmejJn7A+GoCbTjOmyTK
         RBzA==
X-Forwarded-Encrypted: i=1; AJvYcCWyo8/QZAlDgRDfAUn20bUAi0hmctE5ZLyUzCn22dSqSVn7cM+kI/ksbD8rWItdGF0QbQo+Pu7GtHqOuer8vSFQcmerm1K3
X-Gm-Message-State: AOJu0YyfpC4ydsnaVV79SCBvebVrejK3p2fcGzzO7VVvmHg56TQSR43C
	2K7OFa32i860xVLClBzm1OvBTIl3+MY00Lh/SQIXIpmfKwYClflKyJk8e/EDlkqflA==
X-Google-Smtp-Source: AGHT+IHj863gKHFZgln/0mHvZ8mw+pDVh0OE4eOA7e5u0e+MLLV5z5cTOwDpSkbnpDIjyWAJw7qzlQ==
X-Received: by 2002:adf:ea10:0:b0:367:9c12:3e64 with SMTP id ffacd0b85a97d-36b5d073efemr5511758f8f.46.1722254087783;
        Mon, 29 Jul 2024 04:54:47 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.173.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367d98aasm12089148f8f.30.2024.07.29.04.54.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 04:54:46 -0700 (PDT)
Message-ID: <6dbc898d-be8a-497c-87bb-d13d956cd279@linaro.org>
Date: Mon, 29 Jul 2024 13:54:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] tests/avocado: use more distinct names for assets
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20240726134438.14720-1-crosa@redhat.com>
 <20240726134438.14720-7-crosa@redhat.com> <ZqdzqnpKja7Xo-Yc@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <ZqdzqnpKja7Xo-Yc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: CF6Pt2vdx/RQ

On 29/7/24 12:49, Daniel P. Berrangé wrote:
> On Fri, Jul 26, 2024 at 09:44:31AM -0400, Cleber Rosa wrote:
>> Avocado's asset system will deposit files in a cache organized either
>> by their original location (the URI) or by their names.  Because the
>> cache (and the "by_name" sub directory) is common across tests, it's a
>> good idea to make these names as distinct as possible.
>>
>> This avoid name clashes, which makes future Avocado runs to attempt to
>> redownload the assets with the same name, but from the different
>> locations they actually are from.  This causes cache misses, extra
>> downloads, and possibly canceled tests.
>>
>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>   tests/avocado/kvm_xen_guest.py  | 3 ++-
>>   tests/avocado/netdev-ethtool.py | 3 ++-
>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/avocado/kvm_xen_guest.py b/tests/avocado/kvm_xen_guest.py
>> index f8cb458d5d..318fadebc3 100644
>> --- a/tests/avocado/kvm_xen_guest.py
>> +++ b/tests/avocado/kvm_xen_guest.py
>> @@ -40,7 +40,8 @@ def get_asset(self, name, sha1):
>>           url = base_url + name
>>           # use explicit name rather than failing to neatly parse the
>>           # URL into a unique one
>> -        return self.fetch_asset(name=name, locations=(url), asset_hash=sha1)
>> +        return self.fetch_asset(name=f"qemu-kvm-xen-guest-{name}",
>> +                                locations=(url), asset_hash=sha1)
> 
> Why do we need to pass a name here at all ? I see the comment here
> but it isn't very clear about what the problem is. It just feels
> wrong to be creating ourselves uniqueness naming problems, when we
> have a nicely unique URL, and that cached URL can be shared across
> tests, where as the custom names added by this patch are forcing
> no-caching of the same URL between tests.

I thought $name was purely for debugging; the file was downloaded
in a temporary location, and if the hash matched, it was renamed
in the cache as $asset_hash which is unique. This was suggested
in order to avoid dealing with URL updates for the same asset.
Isn't it the case?
