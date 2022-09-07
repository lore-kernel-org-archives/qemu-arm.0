Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp3448294ejh;
        Wed, 7 Sep 2022 02:41:00 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7SRUDLBpcx/QAD7mO8u03SZ0vAIPs3WNa+RHiMEN4l34m47PuF/+PXY1moeuay1GbuNzEV
X-Received: by 2002:a05:620a:29c4:b0:6bc:638d:cf30 with SMTP id s4-20020a05620a29c400b006bc638dcf30mr1910379qkp.443.1662543660228;
        Wed, 07 Sep 2022 02:41:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662543660; cv=none;
        d=google.com; s=arc-20160816;
        b=P5dcnqYmoD5wK9SScByQUoJoRlX/6kzlxTPl1g5Rlpg2ig2lYoImYTmaA1UpjnwxvN
         AxB2mnn4muPZc/dazimzYav1ZQZQKrwvprTKakQ4CW4K3CoXk5PI7wvGlBLB2R4m+SND
         lXwHPZwCdpJur0kX6YcrqZuZ5vXwxSdcZl2VY3KfQLJPzLHcx3JYlFzFs/HTKPmjfYaK
         2MABb0FK7BWp6x1z+JKax4SfpM1yvW9jYd6am1mOdC8VvOlNtiDK0fLaEepPgOvnSEws
         g1+B3xC786yC6R8qX0EKq1VizaG4lT8fUZNW6t2XJpsnD3a50ruCDnkEkZyH4BGL7hl4
         Kdlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=lQCPRTP7XUHSgBJ+Q9RZr9/QFsEyL4XAXMORXHvWHUM=;
        b=iyLOnb/FW3uHmobrnIbwC8Tvhod1VUTNsJxThm1084tjlPcUkAFdsLH2DBX1NQN8CJ
         SKAklIhKLp1GMh80fKDii3vM3PcxWT05VkEnDyS8Sk+oeIfcIhOqfrZmejgBjBH84vUG
         X9M5rfu0n5777eQlX+2Grv+zBwgpaVEJOvCZLaylcVEWxXXooO3qaEDI3ksmirmosFrQ
         9esOdMz+/lZXxIQd8qMYMq85fb1EiW27c4583hfEzTf0rc3vl8JMhIZWFDVZAMwYg+CJ
         I1Mw2QNIzCY0syrHhGVOM/MjjlSjjQcr4W7O/XlolX/j/DkPb4ojgXXhDbHsC4KVvU4v
         CFNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Ihlr7ji/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eq6-20020ad45966000000b004a5dee54dcesi2554553qvb.116.2022.09.07.02.41.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Sep 2022 02:41:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Ihlr7ji/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVrYJ-0003MO-OG
	for alex.bennee@linaro.org; Wed, 07 Sep 2022 05:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oVrUV-000090-Hh
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 05:37:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oVrUT-0002EV-0L
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 05:37:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662543420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lQCPRTP7XUHSgBJ+Q9RZr9/QFsEyL4XAXMORXHvWHUM=;
 b=Ihlr7ji/7QXxW47Jn5/dTw3yYu+nAuonQWlO8RGHKao8czTeF1ebxtYKRuQPrT93QtIgn2
 4WQdWXLRYykEQwItMk9AFhBQmGPJ/Lsi6fcgjGg5SmRdWEQKEzrilANju/zpcWpWxp6+bx
 y+AOaysMdDXHAORKlOUSQQPzeuH6sds=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-AK4USgAaPXGgfBVa7PUVog-1; Wed, 07 Sep 2022 05:36:57 -0400
X-MC-Unique: AK4USgAaPXGgfBVa7PUVog-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D9EC811E80;
 Wed,  7 Sep 2022 09:36:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49B69492C3B;
 Wed,  7 Sep 2022 09:36:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7796B180039B; Wed,  7 Sep 2022 11:36:54 +0200 (CEST)
Date: Wed, 7 Sep 2022 11:36:54 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, lersek@redhat.com, linuxarm@huawei.com,
 chenxiang66@hisilicon.com
Subject: Re: [PATCH] fw_cfg: Don't set callback_opaque NULL in
 fw_cfg_modify_bytes_read()
Message-ID: <20220907093654.3led26of3pqohjkc@sirius.home.kraxel.org>
References: <20220825161842.841-1-shameerali.kolothum.thodi@huawei.com>
 <20220907105220.3f54efb3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220907105220.3f54efb3@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VZaah1po+PCB

> > QEMU_EFI reports the below error:
> > ProcessCmdAddPointer: invalid pointer value in "etc/acpi/tables"
> > OnRootBridgesConnected: InstallAcpiTables: Protocol Error
> > 
> > Debugging shows that on first reboot(after hot-adding NVDIMM),
> > Qemu updates the etc/table-loader len,
> > 
> > qemu_ram_resize()
> >   fw_cfg_modify_file()
> >      fw_cfg_modify_bytes_read()
> > 
> > And in fw_cfg_modify_bytes_read() we set the "callback_opaque" for
> > the "key" entry to NULL. Because of this, on the second reboot,
> > virt_acpi_build_update() is called with a NULL "build_state" and
> > returns without updating the ACPI tables. This seems to be 
> > upsetting the firmware.
> > 
> > To fix this, don't change the callback_opaque in fw_cfg_modify_bytes_read().
> 
> Fixes: bdbb5b1706d165 ("fw_cfg: add fw_cfg_machine_reset function")
> Acked-by: Igor Mammedov <imammedo@redhat.com>
> 
> CCing Gerd to have a second set of eyes on it

Hmm.  Original patch clears both 'callback_opaque' and 'callback' (where
'callback' used to be what 'select_cb' is today I think).  Not fully
sure what the motivation was for that.  Maybe because using both
fw_cfg_modify*() calls and a callback for update-on-read for a given
entry looks pointless.  Should that be the case there are better ways to
catch that, like having fw_cfg_modify_bytes_read() throw an error in
case select_cb is not NULL instead of silently clearing the callback.

In any case clearing callback_opaque only is obviously wrong, so
Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd

