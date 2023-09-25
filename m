Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp282986ejc;
        Mon, 25 Sep 2023 03:36:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhh7SH/c6Vlr0u0KQDTDhEk2ecsdwuMPqFDKuF9k9sfNMEd0vuI2qCgoHtBYwdKxx3PJkN
X-Received: by 2002:a05:620a:4051:b0:76f:39:4180 with SMTP id i17-20020a05620a405100b0076f00394180mr7038192qko.15.1695638174199;
        Mon, 25 Sep 2023 03:36:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695638174; cv=none;
        d=google.com; s=arc-20160816;
        b=y3vN6cLPfahkacb2xbWZlnPg+C30g29nORrOWWyvv1xRhLkQZBUKn9D3CdzNHvr4AW
         iuXqq+rJ+pK1L2n2Rk5QFUWy9JvcPXrOkO6489swlvMQIqYRK6x2Wus6w6q3d7af2OBP
         qXeeXeFw1uqQI63VDSCF16Oz0+fQ1yfDelbJ8xwlp3El7wRqGX3x3khIfZsv9jmwJDtw
         XJ20kHPgXXy3KmaGLPby8ri6/yFU7ZvuRIzjeVOoWT3tdWBdz5Aa38ZE3gvfl987aEX6
         U/7l0TDQwiHllF8v/Nh5fVtKv4OuAvvTl2QD8OZOGcJYAaxCjWT1Sp9L9EBYO1yivEpE
         paSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=Ln3rRGA+NrAyGc0Q21lmv4g7quuTmZccRli4fX45diY=;
        fh=xIvnvgcnpzY0OQ6NJlEGqtf3B2AhMtVF9vWj+5BzMlY=;
        b=UTLPhT2qN8nTpuF5xO2ps4B7Opf+LvDBJLrNyEkL6iOn2UGkzzdwuEOncKRG0qa+MN
         TTQNh5xsa+insZ6zVsyoOCAwX/XNJC3spaBXAj30+/b54RBDFIl4t/iUogfFSz04vwB8
         6pLgCHC6pPMKPSWui3Sxlh71oh8zoTcqAf5gkFRabebrm0Gzn+Gew9KsWwfkKfEdVBHv
         eq8u/rU4+dH/I/qLNWiUgJ4lufLkXXsVwZHkvxcPVBaYnhhRpCw/GpfVocqxvPKqqftJ
         ZlhPuaz+f9+SA/5EXI40UqFJ2fd/Ws8/1R5R9qs5/s0+d9Oqca92GU7VRf8CwHpvMZ0L
         yJCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S1hzIa6D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i25-20020a05620a0a1900b00773f5f53c41si5643582qka.475.2023.09.25.03.36.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Sep 2023 03:36:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S1hzIa6D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qkiwg-0003Hn-Bo; Mon, 25 Sep 2023 06:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qkiwe-0003HC-NL
 for qemu-devel@nongnu.org; Mon, 25 Sep 2023 06:36:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qkiwd-0003NX-CR
 for qemu-devel@nongnu.org; Mon, 25 Sep 2023 06:36:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695638162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ln3rRGA+NrAyGc0Q21lmv4g7quuTmZccRli4fX45diY=;
 b=S1hzIa6Dz0BTvHR1V5ywhnUSngMK7eYlM4dY0uIjph1GMbCq/LJUVesdAfRZpAMvMSduqA
 Q+PUSRF94Eq06LFZ1iz3WbFzDkYg3z/pAZ1hEKWvD6aqexuOWA6O/0uiVYn0XPCIBWHyK0
 ocRFvUdYzOmOapowAAbkOWHPu+Gb4to=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-677-3r5wYVCpM-mnH4qtOn2Twg-1; Mon, 25 Sep 2023 06:35:59 -0400
X-MC-Unique: 3r5wYVCpM-mnH4qtOn2Twg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC8AD811E7E;
 Mon, 25 Sep 2023 10:35:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 992002156701;
 Mon, 25 Sep 2023 10:35:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8880A21E6900; Mon, 25 Sep 2023 12:35:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,  Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 09/15] hw/usb/hcd-ohci: Include missing 'sysbus.h'
 header
References: <20230203145536.17585-1-philmd@linaro.org>
 <20230203145536.17585-10-philmd@linaro.org>
Date: Mon, 25 Sep 2023 12:35:57 +0200
In-Reply-To: <20230203145536.17585-10-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 3 Feb 2023 15:55:30
 +0100")
Message-ID: <87h6nia6b6.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9CItZn6shG2f

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Avoid when including "hw/usb/hcd-ohci.h":
>
>   hw/usb/hcd-ohci.h:100:5: error: unknown type name 'SysBusDevice'
>       SysBusDevice parent_obj;
>       ^
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

This has become commit 4713720a78c56ec2e00bcb4abcac71e99315e4ea.

