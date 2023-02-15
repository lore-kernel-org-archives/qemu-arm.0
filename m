Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp456909ejb;
        Wed, 15 Feb 2023 04:35:40 -0800 (PST)
X-Google-Smtp-Source: AK7set9neezlqGrRXTgJ7O/8oMv0Yr3E91vB3ln3n5c41x784NRi8AwVWIBB6eZZePxjf3YKAjls
X-Received: by 2002:ac8:5ed8:0:b0:3b9:bc8c:c1fd with SMTP id s24-20020ac85ed8000000b003b9bc8cc1fdmr4195821qtx.8.1676464540608;
        Wed, 15 Feb 2023 04:35:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676464540; cv=none;
        d=google.com; s=arc-20160816;
        b=XPkPzRIW+vDLyNELkFH2IEP2IrzB9GpWR6lZFU2rVXfrIl8noINw8lgy4zKf4PPEDA
         RdlYSEEaaI0ZpRzqwaPRrG5bavl231zCZe2yfur66ag6psiXJCev3i6snIIchizQZcoM
         +eoMRAWuahA1FIywg+Iwc/kUaIrOUKe3qszaMFraX/VllMD7nt1x36p71S8TWRuKLgGO
         qVqHrJsDzGNgm/THUD17MC7meK7YkRqKQAaY74nE/xEFmLdNMroHYgzjmI6I+4VWdOzi
         uOOkh+zmFfzfujPRRLYlqyPqjkr3A+QEwM6a/cEJs96iSV8AeNtoi8rtUTsJBlpz94NK
         2Ruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=hTZA01o0W3zEWuP6jbHAq+qLfMaXTDP9wKXEtqjXo+4=;
        b=GvnWDsaqexOqLDoj60njoh12hVk1mpa3cRc0m3dHXiJGHeMi6IcXIYMNCOunMETaS0
         UxtgQ/yxZ2leT5fqIVRLEWvUG4SF6xjM7VJUV8+mqZfy2DQyJmCNG7bx9VyH/kG0LO0X
         JnA/heXlN2S1qEOzmzvR1nkdKJs2sKNnmfOmp6IHNBTdZpVbVmrccGQbzxubwhrzq1jI
         ARqgwS9jVWBcf9KrlwwMq+ZkfUpqiwpE7dV7VGORqnvd9LhKXShmTtvyxJGbZLqRKn7e
         rD7UuDwVzmKhIzceAPaLxjCoLsda3PCJPaURGRCSkGDlspsKspWpRgIla9PmTG84hmpL
         dH3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QwUMAlJk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 187-20020a3703c4000000b006fee8832cb6si13790779qkd.177.2023.02.15.04.35.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 04:35:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QwUMAlJk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSH0R-0007Ei-GU; Wed, 15 Feb 2023 07:35:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSH0J-0007BY-LN
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 07:35:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSH0H-0001wM-Is
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 07:35:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676464515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hTZA01o0W3zEWuP6jbHAq+qLfMaXTDP9wKXEtqjXo+4=;
 b=QwUMAlJkP2Y6SlFtIUdLpXDe7k57+dlRAxaQ//R+Vh8nI+3f5Cj9o7lTNckhdGoL/m0t/O
 WPO0mIriRw0dCHVkdIMNNNPn+BKl3f0tiZjJfMD6K7aXbe0yd1kAKa/Mxz/8tIkyD/PMaU
 KW/7VUyB/icLMZDwWXNUAbqY+LDoC7k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-AODznpsLPxmquydm31z7Ng-1; Wed, 15 Feb 2023 07:35:13 -0500
X-MC-Unique: AODznpsLPxmquydm31z7Ng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFAC185D067;
 Wed, 15 Feb 2023 12:35:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C094B2026D4B;
 Wed, 15 Feb 2023 12:35:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B9C3B21E6A1F; Wed, 15 Feb 2023 13:35:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: <qemu-arm@nongnu.org>,  <qemu-devel@nongnu.org>,
 <qemu-block@nongnu.org>,  Joel Stanley <joel@jms.id.au>,  Andrew Jeffery
 <andrew@aj.id.au>,  Peter Maydell <peter.maydell@linaro.org>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH 0/8] aspeed: I2C fixes, -drive removal (first step)
References: <20230214171830.681594-1-clg@kaod.org>
 <87fsb7e8m3.fsf@pond.sub.org>
 <9dacf24f-3797-591b-b2af-ae08a0c01259@kaod.org>
Date: Wed, 15 Feb 2023 13:35:11 +0100
In-Reply-To: <9dacf24f-3797-591b-b2af-ae08a0c01259@kaod.org>
 (=?utf-8?Q?=22C=C3=A9dric?= Le
 Goater"'s message of "Wed, 15 Feb 2023 09:32:32 +0100")
Message-ID: <87fsb79ke8.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iI+oNNLbJySC

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 2/15/23 07:38, Markus Armbruster wrote:
>> C=C3=A9dric Le Goater <clg@kaod.org> writes:
>>=20
>>> Hello,
>>>
>>> This series starts with a first set of patches fixing I2C slave mode
>>> in the Aspeed I2C controller, a test device and its associated test in
>>> avocado.
>>>
>>> Follow some cleanups which allow the use of block devices instead of
>>> drives. So that, instead of specifying :
>>>
>>>    -drive file=3D./flash-ast2600-evb,format=3Draw,if=3Dmtd
>>>    -drive file=3D./ast2600-evb.pnor,format=3Draw,if=3Dmtd
>>>    ...
>>>
>>> and guessing from the order which bus the device is attached to, we
>>> can use :
>>>
>>>    -blockdev node-name=3Dfmc0,driver=3Dfile,filename=3D./bmc.img
>>>    -device mx66u51235f,bus=3Dssi.0,drive=3Dfmc0
>>>    -blockdev node-name=3Dfmc1,driver=3Dfile,filename=3D./bmc-alt.img
>>>    -device mx66u51235f,bus=3Dssi.0,drive=3Dfmc1
>>>    -blockdev node-name=3Dpnor,driver=3Dfile,filename=3D./pnor
>>>    -device mx66l1g45g,bus=3Dssi.1,drive=3Dpnor
>>>    ...
>>>
>>> It is not perfect, the CS index still depends on the order, but it is
>>> now possible to run a machine without -drive ...,if=3Dmtd.
>>
>> Lovely!
>>
>> Does this cover all uses of IF_MTD, or only some?
>
> All use for default devices in the aspeed machines. I think most
> machines use IF_MTD in a similar way.
>
> Yet, one extra use of IF_MTD is to fill a ROM region with the first
> drive contents. It avoids fetching instructions from the SPI flash
> mapping and speeds up boot quite significantly.
>
> Once the default flash devices are created and attached to their
> drive, it is possible to query the block backend without the
> drive_get() API. I have a couple of patches for it and it shouldn't
> be a problem.
>>
>>> This lacks the final patch enabling the '-nodefaults' option by not
>>> creating the default devices if specified on the command line. It
>>> needs some more evaluation of the possible undesired effects.
>>
>> Are you thinking of something similar to the default CD-ROM, i.e. use
>> default_list to have -device suppress a certain kind of default devices,
>> and also have -nodefaults suppress them all?
>
> I would have -nodefaults suppress all flash devices. There are also
> I2C devices but they are less problematic for the machine definition.
> (Well, eeprom contents can be complex to handle)
>
> The next step would be to get rid of the drive_get(IF_MTD) internal
> API, which means finding a way to attach block backend devices from
> the command line to the default flash devices. This should be done
> at machine init time and the blockdev should have some 'bus@addr'
> identifier. I lack the knowledge on how this could be done.

Possibly interesting for you: commit e0561e60f17 "hw/arm/virt: Support
firmware configuration with -blockdev".

