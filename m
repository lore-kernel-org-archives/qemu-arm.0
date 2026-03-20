Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C1D1099B52
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 23:39:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3jQg-0004dP-3G; Fri, 20 Mar 2026 19:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <landonclipp@gmail.com>)
 id 1w3jQe-0004d8-RQ
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 19:38:56 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <landonclipp@gmail.com>)
 id 1w3jQd-0006au-Ag
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 19:38:56 -0400
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-506aa68065eso22707581cf.1
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 16:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774049932; x=1774654732; darn=nongnu.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NPOeYfcd3a8RIxnu94gsrILewZg9g9bl+gIZgb4Msao=;
 b=Y8SBsRYsJXJKKYLKRpj349E1v2OrFW3I9fb770M+cHQsYbiBnQV8d+ueGFx3NBaSSv
 vMlogyF6Xo8PBc8E4KJS0NsnCpy7fwgDdr6DECkXrigm4SKIPZIlCEhvmo8qmPxS9QTB
 ewE+p31jlN9jicF7zLw1x7ozFumgFDByneE0tJiM0+UudoO8F4rMU+0VwcpHny+hUzY+
 akOSXLKeanKWIWu1SfJ1NNb85aJgP7IVk+ahqwCvaSH3Zc4WJx/n/GiNYgynVb/9Woio
 ZrxWKLC6RJkuWw/OZkghBeWz9b3t5VtJalOYF8/PN/XkARlQU3dAuqotN/si2Wugna7T
 +/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774049932; x=1774654732;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NPOeYfcd3a8RIxnu94gsrILewZg9g9bl+gIZgb4Msao=;
 b=lo77c2FYsDoPMq4+g6dsXLVOwRr0fObsIfOSLX+56eYBtfGQs9QkIzuQkE4S/5Fqt1
 nsQwyF5lxkmkSl1lWoJydAda9Dzdp6GqtaTfxZJ1a/f2AAPK+z4L9AFoJD3u6UfO4arF
 LbbXcSbkCk0RYXnu+mF3T4uXPgUOZf2ST8MzklTJePONUYg6ahQVri0U9j8aKnDtWs3F
 zp6p/dEta6+ArD0bdifinSPW3ZNXbcsmKuH7pingul+4MOeDEFHRXbZcibHjZTqVBibm
 JaruQwZn1NBn2oVp9N8/veVQfOmxkIFR28gosJe2md5a30AEp8HfWZ6Spk4SRnrp+Nok
 LLFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz2wyC9DEUCGmZYOvLibRjkcX96buyD+Pn64ovAEA465tEuDdaaW9YsxB8KeFRVUPEF/XVY8JALw==@nongnu.org
X-Gm-Message-State: AOJu0Yyc+7nyJiEbfxUBG8kkxf+xnr72u8kgIysSeFXeZADXyshzIlDe
 qdBjEd8JOGg/pWpcKV1/Hqi6Xkl1thyvhUvCFy+rOl1BXbYJn0X28qxi
X-Gm-Gg: ATEYQzxwjixZoaufUj3qlV5aZzv++vQKWuldkiTM6nkYma+7YB5kboFeuC8oPl6HHkU
 7fh/xnFtzWqSNiywSZir6gUOmJI1wyRhMY09jYvnnny2E9gbegN9qERhEpnISPGI0f+08/ADwvS
 S558AqYQyAQ2VnPgQollNr6ho7QC3h3/Z3/ECO4DMVvdISkcPdP/bKkOFZTmyDw+6eV0PwwekR9
 P6Efwnux87Fup7N2kBZxUSiwgDLEqMOcoM9rN4zA4Qgn7rYZml9tyAdofrOS39kk9HDTJAqN1bO
 NT1nyk3+REcfXB6OROaCEkJkjshfZyPpk54fP8AoPgV341YVHE0evnZVT/ed4F2KWpWZCSsnAbi
 pUgjWyuldyAHXFgqBjFHE/WeDDuQAWzSxSbUeBtQZ2bUWDkr49cPy4thG/j/0rwLblYgrNkxuip
 X9CN1UmnTM0aDR0uTEXPIdSZBRi3uR+OZJpAB601kYItHiaTmyUCgMZmKEbbnmVMbKrNdsCwRjI
 ps=
X-Received: by 2002:a05:622a:848f:b0:509:61:b22 with SMTP id
 d75a77b69052e-50b37566620mr53148851cf.57.1774049932015; 
 Fri, 20 Mar 2026 16:38:52 -0700 (PDT)
Received: from localhost (c-71-194-28-115.hsd1.il.comcast.net. [71.194.28.115])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50b36cb2e29sm35646841cf.1.2026.03.20.16.38.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Mar 2026 16:38:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 18:38:47 -0500
Message-Id: <DH807PW5SQCW.3AA422QQRGVAH@gmail.com>
Cc: "Peter Maydell" <peter.maydell@linaro.org>, "Auger Eric"
 <eric.auger@redhat.com>, "Xiao Feng Ren" <renxiaof@linux.vnet.ibm.com>,
 "Arnd Bergmann" <arnd@arndb.de>, "Alexander Graf" <agraf@suse.de>, "Magnus
 Damm" <magnus.damm@gmail.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Wolfram Sang"
 <wsa+renesas@sang-engineering.com>, "Landon Clipp" <landonclipp@gmail.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <linux-renesas-soc@vger.kernel.org>
Subject: Re: [Qemu-arm] [PATCH/RFC 4/5] vfio: No-IOMMU mode support
From: "Landon Clipp" <landonclipp@gmail.com>
To: "Alex Williamson" <alex.williamson@redhat.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>
X-Mailer: aerc 0.21.0
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
 <1518189456-2873-5-git-send-email-geert+renesas@glider.be>
 <20180209085024.004b6f9e@w520.home>
In-Reply-To: <20180209085024.004b6f9e@w520.home>
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=landonclipp@gmail.com; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri Feb 9, 2018 at 9:50 AM CST, Alex Williamson wrote:
> On Fri,  9 Feb 2018 16:17:35 +0100
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
>> From: Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>
>>=20
>> Add qemu support for the newly introduced VFIO No-IOMMU driver.
>>=20
>> We need to add special handling for:
>> - Group character device is /dev/vfio/noiommu-$GROUP.
>> - No-IOMMU does not rely on a memory listener.
>> - No IOMMU will be set for its group, so no need to call
>>   vfio_kvm_device_add_group.
>>=20
>> Signed-off-by: Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>
>> [geert: Rebase]
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>>  hw/vfio/common.c              | 61 ++++++++++++++++++++++++++++++++++--=
-------
>>  include/hw/vfio/vfio-common.h |  2 ++
>>  2 files changed, 50 insertions(+), 13 deletions(-)
>
> NAK.  I'm opposed to no-iommu support in QEMU in general, but accepting
> vfio devices with no-iommu (which provide no DMA translation!!!)
> transparently as if they might actually work like a regular vfio device
> is absolutely unacceptable.  Without DMA translation and isolation, you
> might want to think about another interface, I'm not keen on the idea
> of corrupting vfio support in order to blink some LEDs.  Thanks,
>
> Alex
>

8 years later, I was wondering if we could revisit this. I found myself in =
a
need to use enable_unsafe_noiommu_mode due to some systems I'm using not ha=
ving
a usable IOMMU. QEMU is being used as part of a single-tenant workload
sandboxing environment, and given the specific circumstances, both the user=
s and
the administrators understand that enabling the noiommu mode is unsafe and
cannot be used where security matters. Regardless, it's still something we =
want.

As the administrator of my system, it's under my control whether VFIO is pu=
t
into this mode, and if it is, I would expect the remaning software componen=
ts
to respect that decision. As is, the system is unusable because of a lack o=
f
support in QEMU.

I'm happy to elucidate more of my use-case if it is helpful, but I first wa=
nted to
gauge your willingness to reconsider this under a different context.

Regards,
Landon (CoreWeave)

