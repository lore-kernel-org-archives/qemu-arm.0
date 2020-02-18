Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5974283lfp;
        Tue, 18 Feb 2020 02:27:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqzwsPf4ApESSnGcG8kkC6775xZKDHfuDVdTG1qCvU/vprsHLEHctnTkF5SWXrPe8rKIyPL2
X-Received: by 2002:a0c:e4c1:: with SMTP id g1mr16363002qvm.45.1582021655846;
        Tue, 18 Feb 2020 02:27:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582021655; cv=none;
        d=google.com; s=arc-20160816;
        b=NURRR1rIY6aJe1GRpU9gW17BhxeEJAOux6u01g7lrY8KVBC9gwW0Z+qYCr7MPujnmX
         adpxolQYbNh3BDa0YzoRW2TDCnHMmgDCjnPgx8qNU/sKlpEasK7U1Pc0OC86ziPbx5/j
         tKh8QOCf0GzvokXc0G2Zhj0k2AhwmNhVE/rHADDUyHS0vVZqyrCm5hLkDQ1vjEc8LuTT
         Gg6iBiUdShjJD8xhd2OSgP+R67PI8MbxDAm/GQtYK6UF9VKKmMt9OVsUnxZQcIP9fNYr
         u5VMb+yMrepazmcElOru05iS1l+Vuh9vhmpx9pdSzXN+K2KkaUl+RP8H/jMOYC0745px
         /w1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=XLtsRXfsRf4Kv0g5D3cuQ1U5UDCXpxMsaSwdN0MiY3Y=;
        b=gjrcAFRoXE6xipjYkPg1rrKjukVkwJjO+mhRb6usgcKOtdNAvm4GATmU+47XvhL9JV
         ZQwq92sihz+Jco05jh3R+P8P3E9vGjP9wqNxUDq3w4uGfO3V6eP2fxoIY3xphEGRvfrK
         eSnMORd9B3vPDuDq/N5/0Sk3rs8KUxugPG17vVeTPlVg4Rr9zsU2674RBvDAA+wGCzaM
         BFDqxVGLNg0dH9tKSNyUAnIGZaWZRmWTvn1hDFoQzrlGKWR3RwjPb9eFmAZ6DJrj+qJr
         gwQiPloveRDtdD6pNA0qxwE9Fb3y1ZyJpXbd1OeAXLvuOU0eGQUyUflzQP/N2edGP3aZ
         8g6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ePOY0pWM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a73si1728312qkg.112.2020.02.18.02.27.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 02:27:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ePOY0pWM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j406J-0005DG-BI
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 05:27:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50208)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j4061-0004pi-1J
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:27:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j4060-00044u-22
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:27:16 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59686
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j405z-00044W-Ub
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:27:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582021635;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XLtsRXfsRf4Kv0g5D3cuQ1U5UDCXpxMsaSwdN0MiY3Y=;
 b=ePOY0pWM/XoVd2RssC2qdB57VwA9egn8VvrwQQCoKVaOQeIouafIdYtkdRnKEyyfAwlk3+
 q+g4FJFca9Qxcx937SoxYLx9cHtyFPvwUVvAPCBDga6RQMCbL7X0BLBRBOtjFJS0f9Jn8o
 G5iVa3buWT4ex6GXzOb9AXAQbjQCC5E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-rUUxyVzDM9OPhwNOoSjKxQ-1; Tue, 18 Feb 2020 05:27:13 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A5BE1857341;
 Tue, 18 Feb 2020 10:27:11 +0000 (UTC)
Received: from redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C2EB1BC6D;
 Tue, 18 Feb 2020 10:26:58 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH RESEND 02/13] audio/alsaaudio: Remove superfluous
 semicolons
In-Reply-To: <20200218094402.26625-3-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 18 Feb 2020 10:43:51
 +0100")
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-3-philmd@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Tue, 18 Feb 2020 11:26:56 +0100
Message-ID: <87v9o4nqbz.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: rUUxyVzDM9OPhwNOoSjKxQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: quintela@redhat.com
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?B?S8WRdsOh?= =?utf-8?B?Z8OzLCBab2x0w6Fu?= <DirtY.iCE.hu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7TC42ESmSs+v

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> Fixes: 286a5d201e4
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

