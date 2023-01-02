Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp6629987ejb;
        Mon, 2 Jan 2023 03:11:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuXZYc209MVy8dRvKoycny2QIKhYAocQ+pd6Hy2KnPR99fXrKlVctg3gx13spoyS+6glUE1
X-Received: by 2002:ad4:50c2:0:b0:531:cc33:19ba with SMTP id e2-20020ad450c2000000b00531cc3319bamr2522957qvq.15.1672657919151;
        Mon, 02 Jan 2023 03:11:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672657919; cv=none;
        d=google.com; s=arc-20160816;
        b=wJWXWLQenDds0bZ2xESsHuxxKW6m1HExLwB8DpPDlYktX5QLYTCLE4XqipKWn4talx
         OUyA3FaiA10DB/Yw9FqGkEJGurmuAqlBK1UuK4gRXBUqJfjhsjMXMlOa2cNIVgAPejvN
         +bCJx/FpkhqmHlaZNxGXXf2DZ/o4ZbcKskVUnCGNV6VrSzC/4yIbF0JAR3bm2Wm6OS54
         LcN+LEDCzyvdnNtMa4+sWXErZV9V5mJ0Sb/LxVcREUADtcneemEfBXe8WyQhkibNp8kK
         ipBr0xDc334c8Vb3xQg7QmDvKA2J5ilGlTH/3m4wCtWkuVOAo4/gKK8tVhw9+Q/nEJH5
         +GRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=fiJ3JeY3DZH1QGAPckdlcCvotyDT4BcfHg/xG3h7YOM=;
        b=IANz1nejso9x+hKwERr3sY2F16AG2g3e9VgDKY3Tt4DI149ZnSg4/WPUazxvG1+hn0
         388uAQPa6wGL5roFHpib2gO7RuWzyl1Totm1CKzufA0WylcxCVBjPznHVhigfy1i5/gR
         tFUadgsbohXds/sIP9NiL4dXSb144g6EVvDKcC7C0jTLH8d201q5b4qD7GUZOr5GDKHK
         6XZJ73+sJt7TbGtr70V+SEx3U6y7TaYrOy/rdp/bxwxScjj0IbPdsSvm8EA/RunZybwz
         O01sM4dQhIddavNgqJGFqyOAyZvNrRN1Sfxdio5OZoVNm5ExPHxmDxOo/UPTb9JNIngr
         5Uhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fsJIrFkz;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id kj13-20020a056214528d00b004bc1a36b5bfsi13278709qvb.458.2023.01.02.03.11.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 03:11:59 -0800 (PST)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fsJIrFkz;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672657918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fiJ3JeY3DZH1QGAPckdlcCvotyDT4BcfHg/xG3h7YOM=;
	b=fsJIrFkzLrj1aauPSJuMmwXg2Otvt0dsy94IiWLnOOP4egoqFFHIpOCa6ukIvKEHu0Yp9a
	1CZEBf06zOn9zjE51nJPnwy530Qq5F1v1vKayl8Oi1eYCM+EyZ/KBTIJNcjZC3CD4n7jbO
	C/5FnMoAZnAJzw3eFnBVMYYWeZ/200o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-Uk9XEoYHOFiq1dj-1XoxxA-1; Mon, 02 Jan 2023 06:11:54 -0500
X-MC-Unique: Uk9XEoYHOFiq1dj-1XoxxA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 995473C01DE3;
	Mon,  2 Jan 2023 11:11:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.238])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F8EC140EBF5;
	Mon,  2 Jan 2023 11:11:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id A9A9418003B9; Mon,  2 Jan 2023 12:11:50 +0100 (CET)
Date: Mon, 2 Jan 2023 12:11:50 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-devel@nongnu.org, qemu-block@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Kashyap Chamarthy <kchamart@redhat.com>,
	Xiang Zheng <zhengxiang9@huawei.com>,
	David Edmondson <david.edmondson@oracle.com>,
	Markus Armbruster <armbru@redhat.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>
Subject: Re: [PATCH v2] pflash: Only read non-zero parts of backend image
Message-ID: <20230102111150.yd7jv56tp63znbgt@sirius.home.kraxel.org>
References: <20221220084246.1984871-1-kraxel@redhat.com>
 <a31967f6-6de5-bed2-8a1a-68a909850dd5@linaro.org>
 <20221220153301.ku3zxwglhxepet6i@sirius.home.kraxel.org>
 <CAMj1kXF=SNeK6fSgo0821XF+dgs-i__bEoUwvJsDRCtpixsTsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXF=SNeK6fSgo0821XF+dgs-i__bEoUwvJsDRCtpixsTsg@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-TUID: vAcTDgWo9iBB

  Hi,

> > Moving away from pflash for efi variable storage would cause alot of
> > churn through the whole stack.  firmware, qemu, libvirt, upper
> > management, all affected.  Is that worth the trouble?  Using pflash
> > isn't that much of a problem IMHO.
> 
> Agreed. pflash is a bit clunky but not a huge problem atm (although
> setting up and tearing down the r/o memslot for every read resp. write
> results in some performance issues under kvm/arm64)
> 
> *If* we decide to replace it, I would suggest an emulated ROM for the
> executable image (without any emulated programming facility
> whatsoever)

Sure.

> and a paravirtualized get/setvariable interface which can
> be used in a sane way to virtualize secure boot without having to
> emulate SMM or other secure world firmware interfaces.

Suggestions how to do that best?  The only option I can see is moving
the variable policy processing to the host, so any variable update
requests are checked even in case the guest OS bypasses the firmware
(which it can easily do when we don't have SMM mode to restrict access
to the paravirtual efi variable service device).

take care,
  Gerd
