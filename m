Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2829688lfb;
        Sun, 6 Dec 2020 21:59:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/cJ+gv3duo+YgHcdga+Ywuq+rpcS1aJ7CRGADF+2FPMF4yhNRwQ2JEtodhPMJPkVBam7t
X-Received: by 2002:a17:906:178b:: with SMTP id t11mr16790822eje.152.1607320752008;
        Sun, 06 Dec 2020 21:59:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607320752; cv=none;
        d=google.com; s=arc-20160816;
        b=ltf+A/Wb4fnTawjPQ4NlQ0qgtfpzx7RzvRosgNoHkVlbWQHh9ouqWbVv2yv28dLzLB
         28tDVI3dlxxerqF6ceJYy4PQtlS0K+4k/XQN8LTnnoamBQWwke5GqTVfPl/Kw3BLfkqI
         vZwqHHQIYJu5+UpCLF1JDdXeEdqM8uiM8DUbZY2gONMr0cfx7DN4f0n8EePiJ6/1Kn4B
         UqdDjSde4nzM1Un9i4l7dJXJ8OieoogLnkBILMp5sDoZlpOD3Y21xFDkaoZ3Cy4EcQR/
         ZXi118oNJHHw3Ey5Lg9AAcgPD6j/pDJVrNaLfbBsnb+6HT1OJKrMX5VujLqtC/rKtQ72
         X+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=J79ha+sdFVJY1jQ5SwPfSjjvCpXuHs7w7E0i9lDztTg=;
        b=ekZBGw48DJiL3W0YPkH1zG1aUZEuqs3GYLDXf28V3LIS5d0qxXEG7d3bRNkDVkZw+X
         1j/xMe4WQg0+QhgAyEb8IEk/9p6WYjlxeakWL443yEF9yekt9DW2zDvPDPapdCmEhSXd
         lNWgTPbHosimGCKBmncsW+4dxZLbqThpOQXbIBrymxb6lSw30yo96Hl5yuDpfjTIl7LU
         M/l5Kc/TAo0y4z7PcnP1UWvyG44IF/+PEgAHlc3L28fhif2srQHrZO75p0x3It/z2MUn
         bFneDZ08OInpYRJtaL9G1HM5sKy3AgSkGOCYj2P9AoeuQTzYVaguYicDYeimwXoB5Jh0
         JZqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Mf4DPmD7;
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id h24si6730690ejt.452.2020.12.06.21.59.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Dec 2020 21:59:11 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Mf4DPmD7;
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607320751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J79ha+sdFVJY1jQ5SwPfSjjvCpXuHs7w7E0i9lDztTg=;
	b=Mf4DPmD7vZ6/zk+ycgkF3NO47KOkf9/IzzOIYPL97qOMZFR+gRu0y1fyJPSrObAgyTUrgk
	mMOCub9rP5xGEYj/i043Wz3rnLmFzFxZZNO+BQyEbr73DsdaPlVA+VqjjzGZE083r2cX7o
	5zxoQ9RKt8AY93sZtJs5ZxRasy+4srA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-GsG9jOd1Pp6VMq2f2a2Jhg-1; Mon, 07 Dec 2020 00:59:09 -0500
X-MC-Unique: GsG9jOd1Pp6VMq2f2a2Jhg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98228802B40;
	Mon,  7 Dec 2020 05:59:06 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5295A5D6AB;
	Mon,  7 Dec 2020 05:58:56 +0000 (UTC)
Subject: Re: [PATCH 7/8] gitlab-ci: Add KVM MIPS cross-build jobs
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
 <20201206185508.3545711-8-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <112e7a72-1269-2df5-e573-74963db7396a@redhat.com>
Date: Mon, 7 Dec 2020 06:58:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201206185508.3545711-8-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-TUID: ARCtk/AUoENI

On 06/12/2020 19.55, Philippe Mathieu-Daudé wrote:
> Cross-build mips target with KVM and TCG accelerators enabled.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> later we'll build KVM-only.
> ---
>  .gitlab-ci.d/crossbuilds-kvm-mips.yml | 5 +++++
>  .gitlab-ci.yml                        | 1 +
>  MAINTAINERS                           | 1 +
>  3 files changed, 7 insertions(+)
>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-mips.yml
> 
> diff --git a/.gitlab-ci.d/crossbuilds-kvm-mips.yml b/.gitlab-ci.d/crossbuilds-kvm-mips.yml
> new file mode 100644
> index 00000000000..81eeeb315bb
> --- /dev/null
> +++ b/.gitlab-ci.d/crossbuilds-kvm-mips.yml
> @@ -0,0 +1,5 @@
> +cross-mips64el-kvm:
> +  extends: .cross_accel_build_job
> +  variables:
> +    IMAGE: debian-mips64el-cross
> +    TARGETS: mips64el-softmmu

That's already covered, see:

https://gitlab.com/qemu-project/qemu/-/jobs/883985068#L296

 Thomas
