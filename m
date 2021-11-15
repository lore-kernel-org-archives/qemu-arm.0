Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5890518lfk;
        Mon, 15 Nov 2021 05:51:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnKBMtvs9J8aGvg7vkjKcdq49f3++YROq26KBUlW1Z5NdVjs82sT36/+J63PzNSTvORxuC
X-Received: by 2002:a37:2e87:: with SMTP id u129mr30175868qkh.208.1636984301562;
        Mon, 15 Nov 2021 05:51:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636984301; cv=none;
        d=google.com; s=arc-20160816;
        b=dFjaSem2gVKsqrd8NY4lEcrieNP9b5kboSGHsa4koxrQ70S9CXGgRMcTQ1Go1GU+6E
         34ROQkuyokC+L5LyIvhAffa7TBotcJF/8gvkzUOKXhbbL8xhqEiGSdVF3rHdd51bJeOs
         PvxEjPWKzf4RanN3IddATp+A2EXhrXSutjBRjKC43lqGlKXAziNhe0RxmSR4evcwiYXo
         VGRFZewRUDkbw3u8AYCSAvcD3REbXrE0yS0zvePJgtrMXxMTCRZiFCx5ZRNYW7piEEuv
         w91YRvlMZo2JlE467RibIRzAMvmUVEjGY8zCugtMBk/TsNidxA9XfEjGzmsSCos72QVa
         RUnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from
         :dkim-signature;
        bh=DnsB/WUUV5P4fY2Uku0xQfmUw6yQ5MSo3oTCQNXYz5E=;
        b=p36nDtX6OlYAlE21rw8dTGCNp2iqSuMe++11b68shn5P0bWOR66Y3IYFfiBaUy6zU4
         zp5jnjbNX+Fajz65q+o/LaS7bTsh9r01KkqBalqGKtjQIc3ryyxNxLhkbfLa9azTBvaA
         X3QAxzQB/eYZLeqlW4ZsN2nr1OnZOQEHuNmyuRn64jGJeeW0tuYYZw5/eEkCVjkFWAuH
         AYXIEcRjdoMLzhFaq8q741FRkaHtNw0FJZVVao9sN21zoSBqI3JHdjxQwO/okMqJktKa
         xXxvo82P8e0wptfXK3d3FqcRVvAqnYOZGoxmA8H63LMxUs4s4iah7asKqDcymkBNgZAK
         8q7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bNUtjDy2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k8si31672490vsh.27.2021.11.15.05.51.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Nov 2021 05:51:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bNUtjDy2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mmcOa-0002lj-QJ
	for alex.bennee@linaro.org; Mon, 15 Nov 2021 08:51:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmcLx-0000yq-CO
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 08:48:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmcLt-0005yX-MS
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 08:48:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636984133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DnsB/WUUV5P4fY2Uku0xQfmUw6yQ5MSo3oTCQNXYz5E=;
 b=bNUtjDy2Yg4byLqHQns3019P0Dm6xmRgK8s8Gv8iwk58407h0y/VnLHgzpKY+sBi1MEfpv
 bukW759mc7CNqEMi08amDet627j5/kp/Ei2mSBfi8mAMGB/DW4idc78QQDOl52SPM7/N2q
 sl9L16ZUYHiLB18nQnEiXRIlBuOHOTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-IHqQvcv1PaGlnIhEVX2cXA-1; Mon, 15 Nov 2021 08:48:51 -0500
X-MC-Unique: IHqQvcv1PaGlnIhEVX2cXA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 202B31018F71;
 Mon, 15 Nov 2021 13:48:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CEDBA17CEE;
 Mon, 15 Nov 2021 13:48:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6A5AE11380A7; Mon, 15 Nov 2021 14:48:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH RFC 1/2] hw/sd/ssi-sd: Do not create SD card within
 controller's realize
References: <20211115125536.3341681-1-armbru@redhat.com>
 <20211115125536.3341681-2-armbru@redhat.com>
 <CAFEAcA94NzZq6fnvvF6aRJtHV29Wnrtudz4QKSoADo6=-QF5JA@mail.gmail.com>
Date: Mon, 15 Nov 2021 14:48:46 +0100
In-Reply-To: <CAFEAcA94NzZq6fnvvF6aRJtHV29Wnrtudz4QKSoADo6=-QF5JA@mail.gmail.com>
 (Peter Maydell's message of "Mon, 15 Nov 2021 13:40:36 +0000")
Message-ID: <871r3hjzr5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, edgar.iglesias@gmail.com, sundeep.lkml@gmail.com,
 qemu-block@nongnu.org, andrew.smirnov@gmail.com, hskinnemoen@google.com,
 joel@jms.id.au, atar4qemu@gmail.com, alistair@alistair23.me,
 b.galvani@gmail.com, nieklinnenbank@gmail.com, qemu-arm@nongnu.org,
 clg@kaod.org, kwolf@redhat.com, qemu-riscv@nongnu.org, andrew@aj.id.au,
 f4bug@amsat.org, Andrew.Baumann@microsoft.com, jcd@tribudubois.net,
 kfting@nuvoton.com, hreitz@redhat.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pO1uFsiv1PAX

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 15 Nov 2021 at 12:56, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> ssi_sd_realize() creates an "sd-card" device.  This is inappropriate,
>> and marked FIXME.
>>
>> Move it to the boards that create these devices.  Prior art: commit
>> eb4f566bbb for device "generic-sdhci", and commit 26c607b86b for
>> device "pl181".
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>
>> @@ -670,7 +672,7 @@ static void sifive_u_machine_init(MachineState *machine)
>>
>>      /* Connect an SPI flash to SPI0 */
>>      flash_dev = qdev_new("is25wp256");
>> -    dinfo = drive_get_next(IF_MTD);
>> +    dinfo = drive_get(IF_MTD, 0, 0);
>>      if (dinfo) {
>>          qdev_prop_set_drive_err(flash_dev, "drive",
>>                                  blk_by_legacy_dinfo(dinfo),
>
>
> This part looks like it should have been in the other patch.

You're right.  Thanks!

