Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp251860lfe;
        Mon, 16 Mar 2020 09:08:26 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtmdWCJcMrJMHjgjpRQDO6gp1IzE4ektCdSgmprKcaidSwOt/zlvL2t92wo1m0fxH7QSa5W
X-Received: by 2002:a5d:4dc7:: with SMTP id f7mr117736wru.72.1584374906541;
        Mon, 16 Mar 2020 09:08:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584374906; cv=none;
        d=google.com; s=arc-20160816;
        b=KMPTnXjJ9sHYL9ElKUdRjm6zNTMhmiJR+IcClZsGDfQuRGzvuBh4AW/4Lab0bHWnf4
         7T1Cacp7wOkpx1thPhkXAIK9Ainn3iXM3LUVUW978arJ5jdxYR7ER3tt1wYeh+UBN0qk
         fegESS8+ZfHl9gOYDShFTVCbhBjU/at+vwIOzFzCTWYb5ZwfvV4thRhy4pzFsr8MRlIr
         XLe13nFHjGEFOf7el0jYWvlpmb75FBNvt4SGCGi+rfr90yhdlhMBQGolK3NoOKEUjnUr
         68BQHgRPoDN+Jkk9BukiZwH/IDEY5i695d98g5c4jlFXeU5VLce85WIiTyJMcxl2VgtZ
         HRlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kzAY54Ug/Dgdb4+XERmlSJiZ/8IMgFtKzZJKBnbDjxY=;
        b=pUn24sDzpMKWfziUliGhyotMeXKtUHhzucVWWdzXEY3niI2wbLB9289ljTUJWK9dYn
         msiE4zujkoQ8jaSYkD1rI1/tyNBgVhNC7RCaLuSeBOerIqcEYq0wNMDC6ojY+LfG/ay+
         dlq7FCYk9iIuppofmoLnwzQpfWxOiBRR7fjscBVn3d7y6m4NKUzzOz//TIq5kfkZowGw
         MpEdlq4F+WEmRLoi3eixUxhgGZhKP6s0JlfkGq58b1U91pMHMnUuobUk1TwP5sfMg9eT
         MfZTjK70v92EXzdgE5tlzDCX91fn4nIc9tqboPETL+IWuYo/uSX0V1uihqNrZTAFIRcK
         kLMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X4WKY88q;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [216.205.24.74])
        by mx.google.com with ESMTPS id h3si276162wrx.446.2020.03.16.09.08.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2020 09:08:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) client-ip=216.205.24.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X4WKY88q;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584374905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kzAY54Ug/Dgdb4+XERmlSJiZ/8IMgFtKzZJKBnbDjxY=;
	b=X4WKY88qS7QmAUGb7taUeEEVR0JziNXcDQXn/G988BDMIUUc+YhNwUkgj8OJx+lSnS2ssE
	wLCfcsBK6DvdwgE4gPYW1eXDqTB1d3KVEHQ2WpVCFM6f9JzDhxiZsj0csHgXpX17MELeCZ
	VnqvrK3dq77+nA1Ld3zkNPa+rwaiXDc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-xFT0hsGLNPia-cndhgOCLg-1; Mon, 16 Mar 2020 12:08:18 -0400
X-MC-Unique: xFT0hsGLNPia-cndhgOCLg-1
Received: by mail-ed1-f69.google.com with SMTP id p17so15861937edt.20
        for <alex.bennee@linaro.org>; Mon, 16 Mar 2020 09:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q9pxkDoDUc80lR6q2sbnb9Lu1UrGguk51WkG66GGoIk=;
        b=HZsnOgLu/gW6d1cQKRh+gHW9WUU2j9nAvKihIEqZpA71C+hfelYf6IUbxJ3oDTgv8D
         JVzYdPZAFtEgZ6q3iwQjnXeJECXDn7HHs5EuoknWRNXE7X9jYMniQkdVOZtQ4ixGlySU
         ZWYrZhTiFXRsft5y23OwVBhVWYOzIy0q7JfuN0UE2pgvsqbIcRJnjaljLUYSxcf3FH40
         oAHcTiJbPGQHQYknI5DvRdNegbFWBKNMMY2C1ltEvAOVwA61D6XZ3LMkW3o2fqaY8AdG
         +cKPTMarSaLx/GF0bj9FzxXCtJANplighjsv1v5KXxwJT38HdqNh+WD8CcnbOMjBawEs
         6vBQ==
X-Gm-Message-State: ANhLgQ0oEboEjZ2jx99gVkunjVTbjmOy6Yp0sGxcpHKc0sXLh8vupkJy
	+jdoRJXWvuO0Aaj8+/sVaEIxQJ7Ni/IqprdS4sIInjuR5bMJePnGaAQGf+mowJdHQsEduyKFT5d
	3DStW1w/O4f0wRKQx
X-Received: by 2002:a17:906:2969:: with SMTP id x9mr24610877ejd.250.1584374897049;
        Mon, 16 Mar 2020 09:08:17 -0700 (PDT)
X-Received: by 2002:adf:b3d6:: with SMTP id x22mr99071wrd.242.1584374896425;
        Mon, 16 Mar 2020 09:08:16 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id x13sm268246wmj.5.2020.03.16.09.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 09:08:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 18/19] hw/arm: Do not build to 'virt' machine on Xen
Date: Mon, 16 Mar 2020 17:06:33 +0100
Message-Id: <20200316160634.3386-19-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316160634.3386-1-philmd@redhat.com>
References: <20200316160634.3386-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: NIwL5A3tymSn

Xen on ARM does not use QEMU machines [*]. Disable the 'virt'
machine there to avoid odd errors such:

    CC      i386-softmmu/hw/cpu/a15mpcore.o
  hw/cpu/a15mpcore.c:28:10: fatal error: kvm_arm.h: No such file or directo=
ry

[*] https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions=
#Use_of_qemu-system-i386_on_ARM

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 8e801cd15f..69a8e30125 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -1,5 +1,6 @@
 config ARM_VIRT
     bool
+    depends on !XEN
     default y if KVM
     imply PCI_DEVICES
     imply TEST_DEVICES
--=20
2.21.1
