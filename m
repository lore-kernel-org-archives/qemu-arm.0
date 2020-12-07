Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2967304lfb;
        Mon, 7 Dec 2020 02:04:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkE+KN3Lyi0JDKYDuxgUrJ7Zx/siVXT7n8Ja/AdfSuCW+c/K2PvBJhhz0pLEuXUIi3rF9J
X-Received: by 2002:a25:6d8a:: with SMTP id i132mr22054684ybc.5.1607335491035;
        Mon, 07 Dec 2020 02:04:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607335491; cv=none;
        d=google.com; s=arc-20160816;
        b=YyFehSTDnn9EcTxnaGTRXbyKEHc7F3vE6fWpNQLvHB/9IzjvtUaQJ4eFI0LQ6EWTIG
         2oCvmpw+163WvMPX63DT1aZiRVqQB5h9+Kic4DA1GRBobBDkG6dwuwvR8RGvpFUgdis3
         XK72W7enxmzhONnjx8WAT/XfK/JI3QZyHw1EpuS76O0L6p17ugatz4sjWiKJPQ1b7la4
         BHEfn9H4JFGTeH5EFX9BmKYokZ4iV91Dy0U3MH36sL3SQAVlZ6toLwELPQSO9uPZNHtS
         1U7KzK57AlO/A+xa+nQgQ8TBsaM5EtoYy9nj2He8Ff56dPjd8Z+IWdb/uZXvfiSvYW9I
         E0eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=NYGMZWwBeIh3fFPx69mvYjTdx1z088fxfHeToI+lsX8=;
        b=Oj/oMr8xv5DzFBkiqwBsB6mrzctbXQXiMPT7gZ/g41cNVwpv1FmZnmc9mWZyS4CPhp
         sBBvHSqJ2uSNNou/txj0xIqQf9ppABymUo7kzafdvnZqN/s9tJQ1/X2XaZcn16xgsV96
         2uhP0UTXHEv0zxAg9DGlg0UT8OY086+gLcKvoyZqRJuuahLOQYyPZroWbS6KLFezSQgj
         f37PGNd+PNx74VQQCgMjpvc9FjEKKlaM6Zo2AQa09yzBrl348Y0ic4I6BFqN4PYVwWrb
         K7RaxMdgZoIbK5WXVREGDSwOUh3QF7yTWTUPVqastandZK/3Z72DO5SEb7YoauKKr+js
         nv3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="IUj/WNf5";
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id h7si12509794ybm.477.2020.12.07.02.04.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Dec 2020 02:04:51 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="IUj/WNf5";
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607335490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NYGMZWwBeIh3fFPx69mvYjTdx1z088fxfHeToI+lsX8=;
	b=IUj/WNf5h8IqWTIOYg2z84Hv9lQBHEyKKAIlxidutKotmmyqXc3FpcRUuwERstCHy0B0tT
	kf9Z+L1alyvdKNdvuqCwkaIXbeuvz7wF3DLBEs2HwE8c6/p5vABFyblj54irnClcuEHY6I
	I/KvIc6erd2CSwBb2aGFbDlmayJoaX4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-hIVLNijkMTKDQNsaT7tWmQ-1; Mon, 07 Dec 2020 05:04:49 -0500
X-MC-Unique: hIVLNijkMTKDQNsaT7tWmQ-1
Received: by mail-wm1-f72.google.com with SMTP id o203so3956319wmo.3
        for <alex.bennee@linaro.org>; Mon, 07 Dec 2020 02:04:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NYGMZWwBeIh3fFPx69mvYjTdx1z088fxfHeToI+lsX8=;
        b=ZAWcmcDgrdg3DFJPWhC4DCPq4QwLDp49KTwiugtQvrVC1ktN/+GNjwsnOV8QL/3EfP
         3E/+/1FveyNXfKQ8GTF61vvnO9hrHZEn4rMBMTIjKOra1FAlwXGIfkfDoWpsQNiEPamq
         xU0eeeaMWFbS+FGYO6IOqem6oM3hYU8RRfc3/njDi05M255CG5wYNLStHTtqrDijXATX
         49Kxeymax/Ze/7+6wYbr7b3nEPuswq9I3tM4VLg7cnTwiGhhOzi0m+clAwZm4X6tmjgM
         cwcoSaZaPumo7SuOVgbrPsOzbknx1TYr7qFBD/Qx6jraTfIiS7Ig0ZAhvvAmzXU5AArZ
         wxeQ==
X-Gm-Message-State: AOAM531GLGgznLRFj96Egjpqay4FeuqhJyVl7sY19O+ckbZjPoiWA0n4
	sfXJGhsm8e4mITTv8Omku31sq9JD1wz2q6d88DxkQIXXRsfC4u22fabBQ6Df3V1W61lazKV/PCW
	en2S0gcHx7u/dI3m/
X-Received: by 2002:a1c:4604:: with SMTP id t4mr16984337wma.17.1607335487736;
        Mon, 07 Dec 2020 02:04:47 -0800 (PST)
X-Received: by 2002:a1c:4604:: with SMTP id t4mr16984316wma.17.1607335487585;
        Mon, 07 Dec 2020 02:04:47 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net. [88.21.206.101])
        by smtp.gmail.com with ESMTPSA id e17sm4403139wrw.84.2020.12.07.02.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Dec 2020 02:04:46 -0800 (PST)
Subject: Re: [PATCH 3/8] gitlab-ci: Add KVM X86 cross-build jobs
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Willian Rampazzo
 <wrampazz@redhat.com>, Paul Durrant <paul@xen.org>,
 Huacai Chen <chenhc@lemote.com>, Anthony Perard <anthony.perard@citrix.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Claudio Fontana <cfontana@suse.de>, Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org
References: <20201206185508.3545711-1-philmd@redhat.com>
 <20201206185508.3545711-4-philmd@redhat.com>
 <1048bbc0-7124-3564-4219-aa32ed11a35b@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <951882fd-fae0-2dec-5a81-d72adf139511@redhat.com>
Date: Mon, 7 Dec 2020 11:04:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1048bbc0-7124-3564-4219-aa32ed11a35b@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: XT3u37hUKlBa

On 12/7/20 6:20 AM, Thomas Huth wrote:
> On 06/12/2020 19.55, Philippe Mathieu-Daudé wrote:
>> Cross-build x86 target with only KVM accelerator enabled.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  .gitlab-ci.d/crossbuilds-kvm-x86.yml | 6 ++++++
>>  .gitlab-ci.yml                       | 1 +
>>  MAINTAINERS                          | 1 +
>>  3 files changed, 8 insertions(+)
>>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-x86.yml
> 
> We already have a job that tests with KVM enabled and TCG disabled in the
> main .gitlab-ci.yml file, the "build-tcg-disabled" job. So I don't quite see
> the point in adding yet another job that does pretty much the same? Did I
> miss something?

I missed it was x86-specific myself.

> 
>  Thomas
> 
