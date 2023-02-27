Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4509190ejc;
        Mon, 27 Feb 2023 03:10:59 -0800 (PST)
X-Google-Smtp-Source: AK7set8AWTVbtVdIL68AqtNN+oGOHkDQfj4m6CWkx39M3SykQfbF0yYFIGvSrf1ys7LclGc9Vv1f
X-Received: by 2002:ac8:57d6:0:b0:3bf:d950:efc4 with SMTP id w22-20020ac857d6000000b003bfd950efc4mr5153949qta.26.1677496259358;
        Mon, 27 Feb 2023 03:10:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677496259; cv=none;
        d=google.com; s=arc-20160816;
        b=pWMfEO8mXMb2nYEgirE2R19Jf9wYFmPqXBfTc8K/XBYFXRI5/bvDVsYfqdE7zLh4LE
         fbC2Ely3ewa4zaKAjGWCacO6sisqmHgy/tBC5iNh0FCOucs0qb94fhTDXIJL0dGLYaiu
         /Sq/hsT8AFLumaXIK75EKpj8MJLgKWQj6Pg14dP6DD9vEX8LYvfMo0dMZGRFm10sFG11
         wjwgX5lv+/d0x0ejPvrZbunyoZHG2fSA5oYqa4pb8z05fmZOiIc05cJS//hgt/+oJ3RS
         v///3xNtH33Re9CxjDtDT0XBTNig+fN0+E8NM+OEopCGVCeJi39Dru45vn1Dl45mi3Qr
         R1cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=HqNrPaN6lC01QUipjdhuAjHY1FZrvMej85mjtvyYQtg=;
        b=U0UuiQNqsOiq10j/xKT8jnV/R05RcfYyVEzP5QyQjW3Sty/5tcMZCVHgKHCDKhKjCF
         CswHM+8SSVpxLIkPXOCrIXZ/VqMnrn0pm5N8PYSY4TH9D3afa3SZDGVpcHnW7uSUldGv
         EPpHJetACDWJCnAl1gADS47DyfSrBqYWD6zvyjHrjpdIc0/YwS5vMJfPZ+OQUxZ/JtD+
         6T6lLqxIIbOKeY4zAs/1/+COWLNmPPFmO0/OobZMQUwR9YYUjYsvjOdYJTTLCkXBdCfJ
         es7CsAECAEIZ3/pPecq+SOAcNaZPZ3Q2JRoEJqfqiRevYjVdolIAKlIza1OFFhEjbGTX
         Xf3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VaBe367T;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id m127-20020a375885000000b007416f83da7dsi5722883qkb.285.2023.02.27.03.10.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 03:10:59 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VaBe367T;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677496258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HqNrPaN6lC01QUipjdhuAjHY1FZrvMej85mjtvyYQtg=;
	b=VaBe367T/Nf0hqu8jxiJe5IB9iS4QYpIaxBKaqerJWXgKvnqEp9YONX6cAAoeKKKX43UlN
	jrSGre4U6vhlCFcMxAkq10cTlx/qiGRyMsZkknHXBdS6myaKPmf4972BL0BruCBoMMGGMt
	TUAazd33FiVApaKcCT4T493mjbFmM3o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-3BnZ8YXjO9i2G0RP3ALa-A-1; Mon, 27 Feb 2023 06:10:55 -0500
X-MC-Unique: 3BnZ8YXjO9i2G0RP3ALa-A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AD063848C27;
	Mon, 27 Feb 2023 11:10:55 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B36A740C6EC4;
	Mon, 27 Feb 2023 11:10:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Daniel Berrange <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 0/2] Deprecate support for 32-bit x86 and arm hosts
Date: Mon, 27 Feb 2023 12:10:48 +0100
Message-Id: <20230227111050.54083-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-TUID: nQVBLnStnfSz

We're struggling quite badly with our CI minutes on the shared
gitlab runners, so we urgently need to think of ways to cut down
our supported build and target environments. qemu-system-i386 and
qemu-system-arm are not really required anymore, since nobody uses
KVM on the corresponding systems for production anymore, and the
-x86_64 and -arch64 variants are a proper superset of those binaries.
So it's time to deprecate them and the corresponding 32-bit host
environments now.

This is a follow-up patch series from the previous discussion here:

 https://lore.kernel.org/qemu-devel/20230130114428.1297295-1-thuth@redhat.com/

where people still mentioned that there is still interest in certain
support for 32-bit host hardware. But as far as I could see, there is
no real need for 32-bit host support for system emulation on x86 and
arm anymore, so it should be fine if we drop these host environments
now (these are also the two architectures that contribute the most to
the long test times in our CI, so we would benefit a lot by dropping
those).

Thomas Huth (2):
  docs/about: Deprecate 32-bit x86 hosts and qemu-system-i386
  docs/about: Deprecate 32-bit arm hosts and qemu-system-arm

 docs/about/deprecated.rst | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

-- 
2.31.1
