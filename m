Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2810161lfb;
        Sun, 6 Dec 2020 21:20:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2YAS7RiRaff9wGb1eB2//3bX0bq6MuYZGHqaPOIAEsxBwJ+FzPhRXbzeHnbQMrWOkPi6z
X-Received: by 2002:a17:906:7cc6:: with SMTP id h6mr17127276ejp.161.1607318452341;
        Sun, 06 Dec 2020 21:20:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607318452; cv=none;
        d=google.com; s=arc-20160816;
        b=ZY+lA/XpyvCMaCaPwxMO7JTOR+tYvs5aMaUSXJPYZvh0DJbnG4TZmC2b0Klfd6mRu5
         S4yvLJCMy4qoQM6WWRRz3vxLKeuG1rg+fWxbMtCaVgd3fm/6bLfsOJ4umNso68Zkqnkp
         rJh5yXMehOSppa7LOv77rSEmEYlVQ+/A8GGjknfeE6xw//ob11/QsI++3JtIPwG0RjgN
         WEPuMUBonWxhuO1turHnE0hNIFUSCKNMiwcAh4+AtMyBVedfQgOo1uYfZbB9vhu+UFNI
         RbL/ybVUPjqcuQeBn2aKiQ5aut27D4PvqJou4cS1vUblY/GV07E3+u96WwGTW1S3LgwR
         fYJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=5i5jUUW575PHEv2nQ9iBjazPdMewihveiWGYT6cOBCc=;
        b=mJlJsnQGRS+zzoCx4Dxn/in1Zc+RoZmbPSqrzON3BKrncdpHMuHtRCfPm8Vtjkwfhm
         CHEB/CaTfFy6i8wKTCg+SdeU+g6Yx4EuKktS8vsSrCddcppVo47cLRkIE6xe1DiZmgrQ
         I/rt44i3gaFAb1n6DSDqRliPZOD1tnG3bCOsHSOkYxEa3T+rlpLYUzok9+Qk/Ft0tEh3
         JzqWO/HMaSTLqxFYJN/del0ZnCYHtTPv5Xjnkdyd1oPiIwTDIfymmovwEOfXkSA8Z6w7
         1QHe95jtVI1wyVseniNYHbX0OSHbpIVo39dE62kyuWBgE05WCjuxjMygHfRg0JJjhkR3
         Nrzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HfV4Ww8y;
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id ca6si1659181edb.504.2020.12.06.21.20.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Dec 2020 21:20:52 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HfV4Ww8y;
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607318451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5i5jUUW575PHEv2nQ9iBjazPdMewihveiWGYT6cOBCc=;
	b=HfV4Ww8yr14fKlE2T0NMaxsH+ItBz57KalYIE4r5FWSAdRsIVBxFK/YqYpHhKqmfEm2Xra
	mQn9UtDHoUVnVJMyRjVeGBbB5uOjNz6wM1w8d9pTnXPJtHuigC7DpdMtGPr/5BAeiVopgY
	QQFS62rHPVJ7fxvj1PW6Ct5PGtQhQVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-xoOH7ohQMkiOcx7_FPWO6A-1; Mon, 07 Dec 2020 00:20:49 -0500
X-MC-Unique: xoOH7ohQMkiOcx7_FPWO6A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DEF91005504;
	Mon,  7 Dec 2020 05:20:46 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1CF885D6AB;
	Mon,  7 Dec 2020 05:20:35 +0000 (UTC)
Subject: Re: [PATCH 3/8] gitlab-ci: Add KVM X86 cross-build jobs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
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
From: Thomas Huth <thuth@redhat.com>
Message-ID: <1048bbc0-7124-3564-4219-aa32ed11a35b@redhat.com>
Date: Mon, 7 Dec 2020 06:20:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201206185508.3545711-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-TUID: 9SQ7c/KkZi3g

On 06/12/2020 19.55, Philippe Mathieu-Daudé wrote:
> Cross-build x86 target with only KVM accelerator enabled.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  .gitlab-ci.d/crossbuilds-kvm-x86.yml | 6 ++++++
>  .gitlab-ci.yml                       | 1 +
>  MAINTAINERS                          | 1 +
>  3 files changed, 8 insertions(+)
>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-x86.yml

We already have a job that tests with KVM enabled and TCG disabled in the
main .gitlab-ci.yml file, the "build-tcg-disabled" job. So I don't quite see
the point in adding yet another job that does pretty much the same? Did I
miss something?

 Thomas
