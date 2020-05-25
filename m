Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1927346lfc;
        Mon, 25 May 2020 04:03:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmqesGD3/SBzuKD6GRLOKC40lAF+8wkEnPYYZiuumUAwTD8BLJGx+3jMdvN+nvf/7bvPDe
X-Received: by 2002:a05:620a:247:: with SMTP id q7mr20542808qkn.36.1590404603101;
        Mon, 25 May 2020 04:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590404603; cv=none;
        d=google.com; s=arc-20160816;
        b=SVGWYP86b8ykNoG0Rxh8Qywqu43rYgXkZEWKaeCCuovEedCF6rElQZB41eRof6UOcy
         c5jx0ODYNWKAXI1RrOcAIyul/hOJnAD+7iDxFMQyMAaDoF0ZHT82IwHPMUcjo2GkTYtN
         kPUBrdTyPKheaYz/buJDd3ClFAtMnWXJoxttfGadMH9rn7bisWo3ZO+yAcXR0rEeVOrq
         GY1l4QDa0HXaFR9OxK7NwpIPX3tC8+sIHpmtDaq+55TteGICyzo50vEhKSX7ebNvKgup
         ux6CqJlaklJaNWjqGYqAzEkQusIUNiZizvuL97sSGg+SRsqnKeI64DmZHl/TRU22k9r2
         q2GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=R6aqatswcZgMVTag2iZhLDJk0xwe2ske6jemKPVaR44=;
        b=gIuXM4LfyEy2B+i7DSuNLZOCu69x0y2o3UM58fdHhy72mkIkMfz21CEjwMMfZ75UOY
         qyvqSIWaPrFnlHDlIck+cL+QQiLdQKZgr2aPoWhRWZm4Y/ztUkXa0cCRBU/IAQlKbuHb
         4VvUjAQyz5XKSLiLuDcIiDktcW4LE2e0nW6PcxJd1McNd8QSRF5oOrdKbpe2mC015C0I
         KY8yy9x0xobMtcmsQ/tYPJj66tYGDz6OIKNcOy8BdSeNQkT73Wq1rj9C/+xKO5SZ+qVv
         TqxBaJYXxXwjbW5NdihcUDDmdaTwqvLoGCxrMgLA4e2ogI76Ab/hZ0dFI4MLbnBNiNYx
         0Fag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=f2PUm5JD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k139si4310751qke.270.2020.05.25.04.03.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 May 2020 04:03:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=f2PUm5JD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdAt8-0005mM-Jx
	for alex.bennee@linaro.org; Mon, 25 May 2020 07:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jdAsv-0005iv-8i
 for qemu-arm@nongnu.org; Mon, 25 May 2020 07:03:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44358
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jdAsu-0005sn-Lm
 for qemu-arm@nongnu.org; Mon, 25 May 2020 07:03:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590404587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R6aqatswcZgMVTag2iZhLDJk0xwe2ske6jemKPVaR44=;
 b=f2PUm5JDaQ8go744NtWmtlDKbCDLGXWeK0TroG2nPfRLq4kdnYeJHQvUcej/5Q9ruQb0w9
 EojFEfoMSYWr2oQtz21yNVuiG00dpNU6boz12o4V1jDc6COFVd9RtFYQbkItJqyKR/LN1e
 Yj86iCM0QyoxVo+qApZ40m3XNS2DiN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-_3pz70_HOiGhggznXkkwZg-1; Mon, 25 May 2020 07:03:03 -0400
X-MC-Unique: _3pz70_HOiGhggznXkkwZg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 923AA461;
 Mon, 25 May 2020 11:03:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0799F6EDAB;
 Mon, 25 May 2020 11:02:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CF3C11753B; Mon, 25 May 2020 13:02:54 +0200 (CEST)
Date: Mon, 25 May 2020 13:02:54 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 01/22] microvm: name qboot binary qboot.bin
Message-ID: <20200525110254.ikq6anobblj4uo5a@sirius.home.kraxel.org>
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-2-kraxel@redhat.com>
 <2a9e8f07-a1eb-9c3b-5070-51d5a87d76d5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2a9e8f07-a1eb-9c3b-5070-51d5a87d76d5@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/25 01:44:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dPD68zV3QitG

On Wed, May 20, 2020 at 03:25:53PM +0200, Philippe Mathieu-Daudé wrote:
> Hi Gerd,
> 
> On 5/20/20 3:19 PM, Gerd Hoffmann wrote:
> > qboot isn't a bios and shouldnt be named that way.
> 
> Still it resides in a directory named pc-bios =)

Yep, that should be named "firmware" but changing that is beyond the
scope of this patch ;)

> It is used later in x86_bios_rom_init() as:
> 
>     bios = g_malloc(sizeof(*bios));
>     memory_region_init_ram(bios, NULL, "pc.bios", bios_size, &error_fatal);
>     if (!isapc_ram_fw) {
>         memory_region_set_readonly(bios, true);
>     }
>     ret = rom_add_file_fixed(bios_name, (uint32_t)(-bios_size), -1);
>     if (ret != 0) {
>     bios_error:
>         fprintf(stderr, "qemu: could not load PC BIOS '%s'\n", bios_name);
>         exit(1);
>     }
>     g_free(filename);
> 
> Many 'bios' occurrences.
> 
> Should it be called 'qboot.rom' instead?

I don't care much, I only want bios*.bin for seabios which actually is a
complete bios implementation ...

take care,
  Gerd

