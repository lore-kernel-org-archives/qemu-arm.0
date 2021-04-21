Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp813264lfb;
        Wed, 21 Apr 2021 15:03:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFM4Tub7dHrcDXu9r2YrPpSHzUN6qAVv49HLje2LqM7XLzyCqroHbttF+wMUlwG+D8Dvsn
X-Received: by 2002:aa7:c7c5:: with SMTP id o5mr104012eds.31.1619042633600;
        Wed, 21 Apr 2021 15:03:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619042633; cv=none;
        d=google.com; s=arc-20160816;
        b=rbD0IdDpzzeL5Ukk/t4y+lmrE5Zxyj7m4wOAqfCcTv0xYwhCydHT94BuZWPeX2JxFc
         A76sI3pklBt9JOTmafpA20Qm0ioZ75LhsdrrlMe4wwctmqVolrQHizVZlj0de8z5T3AP
         93T0L8PC0aY6776X0YrTVuuafrisaXZ713qNDFuA4tD/pUjOd94/Kzmr1fxqvaGLwO+Y
         uRUEjMYUvq42EXxljXlkIcG58qKI/f/yhlYIR7ciW2zzcY6pIQqz7t2v9jO7NojR8ieG
         e2QAMAQL/sqdZLSL7OLQDhgUUlg9PIN6BczNcAjxqdUncs3dL5HikkvLig+u/13sw3Ue
         Npcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=ZKwAZgnosTkIVH7gtSI1QhJKu5U41iES4FQ7MOxeanI=;
        b=DeTCR8sDXZgd7YZzTRir8E4Lwqu2y3KH6QwRTDvY+ArgwpqG69aKxHMsj+wDbdDghi
         zMxqq43ORtGv5fdzn5BqPN8z1/8twt1vSZii0AFBvkrsxtT0bl8oYc1SSTnmIamPhsog
         FsueLNxdGRbRYwV1Tr2mb4lUERgCzvxhhD7yoZa5UKxlhpuMnwIQUtjE26DUoFm3EOl5
         ju14SoNRKlLRJ571bJ+FqDkcMGe70mxtlOKdtQ9+DqNRquPPxW3HYGhpdUVlQax957E0
         sMFMj/hVDWlehNV6ZCszr7uT/gV3aWz4IzoMTaPKdzFTlPFijtzDjpIQp/SOmv0XdU4f
         hL6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IHDu9ouG;
       spf=pass (google.com: domain of ehabkost@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=ehabkost@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <ehabkost@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id q11si427351ejz.699.2021.04.21.15.03.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Apr 2021 15:03:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of ehabkost@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IHDu9ouG;
       spf=pass (google.com: domain of ehabkost@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=ehabkost@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619042632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZKwAZgnosTkIVH7gtSI1QhJKu5U41iES4FQ7MOxeanI=;
	b=IHDu9ouG4krxPp8xrz0lJQnwlZKzK8AfBSsIiTzRhNQQdC8L2oA7qLnInZkiV1PxeDc+EC
	IsrgBbjLL0dr7Xw2B0OpxzLbnWFAyzW1wyKGVDJBe3zrvNhdh981dm2MahGzdknZ4X+hBI
	BUqnrpD2ml3PpVQSWFYBKHU10HULZpo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-ALkarCY0PDa5RIVge3tpEQ-1; Wed, 21 Apr 2021 18:03:48 -0400
X-MC-Unique: ALkarCY0PDa5RIVge3tpEQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26B7D343AC;
	Wed, 21 Apr 2021 22:03:43 +0000 (UTC)
Received: from localhost (ovpn-117-199.rdu2.redhat.com [10.10.117.199])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AFD7C5D9F2;
	Wed, 21 Apr 2021 22:03:33 +0000 (UTC)
Date: Wed, 21 Apr 2021 18:03:33 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Sarah Harris <S.E.Harris@kent.ac.uk>,
	Chris Wulff <crwulff@gmail.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>,
	Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Taylor Simpson <tsimpson@quicinc.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Cornelia Huck <cohuck@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v3 01/27] target: Set CPUClass::vmsd instead of
 DeviceClass::vmsd
Message-ID: <20210421220333.bkxo6zriqe6w3rim@habkost.net>
References: <20210302145818.1161461-1-f4bug@amsat.org>
 <20210302145818.1161461-2-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210302145818.1161461-2-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: MrcT3ahJvQ4T

On Tue, Mar 02, 2021 at 03:57:52PM +0100, Philippe Mathieu-Daudé wrote:
> The cpu model is the single device available in user-mode.
> Since we want to restrict some fields to user-mode emulation,
> we prefer to set the vmsd field of CPUClass, rather than the
> DeviceClass one.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Is this going to have an externally visible effect?

If it does, how can we make sure it's safe?

If it does not, do you know why CPUClass::vmsd exists in the
first place?

Do you think it would be simpler to just squash this patch into
  [PATCH v3 08/27] cpu: Move CPUClass::vmsd to SysemuCPUOps
?

-- 
Eduardo
