Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3326068lfq;
        Tue, 19 Jan 2021 05:32:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5Zhmsys9+NLkkSjL9glkcDnNlNJkoR5IoDg7Fqjk8YRB3KX2W5+0t2QKO70oZKNGG26ad
X-Received: by 2002:a25:da81:: with SMTP id n123mr5838337ybf.179.1611063172943;
        Tue, 19 Jan 2021 05:32:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611063172; cv=none;
        d=google.com; s=arc-20160816;
        b=oRS/m+b8W/+cD4ln2l0YiYTZV+c5WC54QsyFqDdSbxTEU7B1tskILLHAtm+94mWAGJ
         vQyWMLIwCl3gP+3uOu3fAxYnPmXvau07AVpY9JpIATMCmonlxoyAe457UWM5W0Wg5oL9
         pilC+0ERYlMaKHNLGXOf73uNU2vQQmGyx8JRr8gntdwcJNVj2pMrEETA5hWhGnWuL2JO
         6Vpf2sEo1MX9b6j1QB7i6HyeEjDC8QpGy9xzAhcQYA7IlVcV0nee7YWOkuWBnPW80ZFk
         sDnbxyMHv/a8i0qjoBU6iNX4i3euRIkRBvp/Z+jYfXlycbsuh68GejDEL+8BLOhIor8x
         oRqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=McwflRvpuADbnXsQ9z7Mrv30L7ZFQBot8rTULjaKimo=;
        b=Av/k1pJ2st289Ns8IqUXNWn81qNP/sApG5xvcgi+zo7/wQdnJ3GbRWF3NkRiPKBlCz
         bhlTnoKixSMt5NOwL9l0txEJpWuQ7Yd0E2RBkS41fyqA54K0ZGOt14mYHHuW/wIFgZ06
         CVdTuU7bJOFsIDjFEIGVVjwjaJDipBNX8/ijF511JzycfyNNEDWChJJlGRM2iWFIA1Zz
         ULvFv4zWfrALQk/cs+85BzmcF6CibcMCW50a1lFHS4LMXbU+HdAHEvSmotzV7fX6p6Im
         Ggfsb76fySfmILA5B20ZvJ1wCjtcSK4cgnGJ2X0pwDPxLGomUMwuCOQmcxj3wAPD+G28
         8hWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="USf/mlx3";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9si18351153ybm.409.2021.01.19.05.32.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jan 2021 05:32:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="USf/mlx3";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1r7s-00065C-AN
	for alex.bennee@linaro.org; Tue, 19 Jan 2021 08:32:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1r74-000641-K6
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:32:08 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:41923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1r71-00024a-F0
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:32:02 -0500
Received: by mail-ed1-x534.google.com with SMTP id bx12so7502882edb.8
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 05:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=McwflRvpuADbnXsQ9z7Mrv30L7ZFQBot8rTULjaKimo=;
 b=USf/mlx3CGcedBgyRKICTXQ6tvEOV6QXlrBqpyLngQRk1GNQfUjzJsQ8KFjN80d2AT
 kAQ1WrpDEMa0NvhKOzMsWD3QqzFoOQbS4XVHUfj8U0rntsExDrPo8dtjTI1nv9idUhFr
 oJg/aLp6AYr1SD/At9s4CjS/BH/o5OZ21S7pLG9GYdofP6CP8znKUr0uFbLhSpLI7RJ6
 HTCCgo+LSL86tAcT4AH9NLVi35YO18mcf4A1h+006QSLi12mqv2leNz9xbhwwFJqsgOh
 phs0pZ5Ny8LObVgll02NGSshx5mD6oNvcap9CH9k80Xi/hrjW0CPhj2yWScJL12UXjUb
 BBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=McwflRvpuADbnXsQ9z7Mrv30L7ZFQBot8rTULjaKimo=;
 b=sFdSNC6qUU00S8/31nKm+dLdKXzFum9BMvWTwt1tBY01QVy4DUDdI15wZz+Jy0szZ5
 BTVcDsBvVqDvoSA+UNn44tr3tX0JspAIlXBu53A1RGkOgFPwGzozsONa267EOfTYtYhM
 AbLA2OBgoqp23gGPnn8stj68KjwB9/OCUBoPdZm/Re0hUi0nGz0p8GBqFYHyh+frMnXs
 DBFcmZJU0PjNHjYieGfTFQiBwbpoicGQfWMSPJ83Ql9/f2wLRLRyKR0hRgN3UjU5tgI+
 dWWnpd2MoaNAEq/r6vOwCkZHRP/FwPNg5Hx8ESShkwI8YyXYTV0ECkKnK2GdTQ5hO2hi
 VMZQ==
X-Gm-Message-State: AOAM530uHB+edcbGtJwR4b0TybmG16Tw0EmqolnK6VSOFfkAcPM/o7Wp
 D1q4xLl6CB7O5T4Fj6erM1A9nm4cEXYY2cdwyGbTXw==
X-Received: by 2002:a05:6402:1a55:: with SMTP id
 bf21mr3530164edb.146.1611063116121; 
 Tue, 19 Jan 2021 05:31:56 -0800 (PST)
MIME-Version: 1.0
References: <20210117192446.23753-1-f4bug@amsat.org>
 <20210117192446.23753-3-f4bug@amsat.org>
In-Reply-To: <20210117192446.23753-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 13:31:44 +0000
Message-ID: <CAFEAcA8neyKTfdhJWhq8YYnQ3VjiJx=q0_mi7+d1G3vfR-cwuQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/20] hw/core/qdev: Add
 vmstate_qdev_no_state_to_migrate
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IktDjcugPc0A

On Sun, 17 Jan 2021 at 19:25, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Add vmstate_qdev_no_state_to_migrate, which is simply a
> pointer to vmstate_no_state_to_migrate. This way all
> qdev devices (including "hw/qdev-core.h") don't have to
> include "migration/vmstate.h".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Unresolved issues:
>
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg721695.html
> Peter:
> > Does this definitely not put any data into the migration stream?
> > We don't want to change what's on the wire for machines that
> > use devices that start using this. (If it does by default, it
> > would be easy to make the migration code special case the
> > magic symbol to act like "no vmsd specified").
>
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg727634.html
> Dave:
> > I'd need to test it to be sure, but I think if we added a .needed
> > to vmstate_no_state_to_migrate with a function that always returned
> > false, then I think the stream would stay unchanged.
> ---

It should be easy to test -- just do a 'savevm' of a running
system with a machine model that uses one of the devices that
has been marked as "no state to migrate", then apply the patchseries,
and see if 'loadvm' works or not.

thanks
-- PMM
