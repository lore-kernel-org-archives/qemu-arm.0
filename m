Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1261936lfb;
        Mon, 6 Jun 2022 03:21:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwV9dRITnob5SYeCjVsGJoU3BODbi2DU9qeEaXLMeg/4+285M0xs3Y8tj6HqthI2/d/9gvT
X-Received: by 2002:a05:6214:4104:b0:431:d89a:66bd with SMTP id kc4-20020a056214410400b00431d89a66bdmr72930059qvb.42.1654510906962;
        Mon, 06 Jun 2022 03:21:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654510906; cv=none;
        d=google.com; s=arc-20160816;
        b=TqhasT8YevaTkm1o3y8hy6epxf48bwKy/mHYCf4SIZ/4kUaSnwwKqmTsOQu/2ZUOEV
         ld9daFgg0Eo4FNIg+m3Ewbduv2Dw/90FHhR4lb+PiMSpxL7/jHGrE70sRtKqDvYvEWsL
         zMRFplCOwjuL73b5cumzklJlC01bVr3lfuICdybzAmAUNVM1bp2GBSlZqK6fyIGogPuG
         OXLK37bHq6qGuv9Ej3ZmD/yefjAZE2gR/VdgpDJD0E6MvQRwXBrzSv71PRBlllgOdcV1
         4gkWJbCZhovB785MzuZ+NxoswlkX+Z/x4I8HLBEdDyBtmqRkyAdpTPCuitENr97JxOjT
         RohA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=r30gGWM13TxZGi60P97WSudT+FWPB6VdDMnw1EArf34=;
        b=R/QNzpYHkXN7thp0JftUBNP4rNXv2eS+FhgF2FBtCeqCQLA4RaJGQVCwV1xJMfI+DS
         Kb+TgSMf3uCRU5p3jr/6r+HNN+o4z2g3yCAQiZUBWZW0V+br4eG873ck2NF/+OLAmYf2
         Ae9RZ/s8+vlt7D5MHtFwWvWklRIv4J1C0Kn5moNtVkqWQ+ZgFSz0Zg3reMn0zF7A6kBr
         ScahMGRRsu32kcD88ulFyZLXATTgAaKj5TUiG459Wmu3DtMv6HoxGK6W/r/vZ2Lkably
         Md807JSS2Nz1hwwTn1eWV17elaVG4l1aniGn3NriN2ET/rcxDv4xLAUwYW4LkTpCS7rm
         hmkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EKz9bQ+y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v190-20020a3761c7000000b006a6acea314fsi3621117qkb.428.2022.06.06.03.21.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 03:21:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EKz9bQ+y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ny9rm-0004T1-8M
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 06:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ny9q5-0004SB-Lt
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 06:20:01 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:41706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ny9q4-0004wX-04
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 06:20:01 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-30ce6492a60so138108237b3.8
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 03:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r30gGWM13TxZGi60P97WSudT+FWPB6VdDMnw1EArf34=;
 b=EKz9bQ+y0zRiPX5uuNuEnjrmdw1Z96Lb0VmvfxUVQedmxoLQg0inE4pkjrpNXig9sS
 qcSBaTMNx9tvERTVJ3pW5dhoD+5KrMK8L4ROk4sVnTLLgMPKV0hKls2uHAX4RvVmx2md
 u5GK9KpBltpd00Uipkz6cMO5FDZlGCtlYdxQ+ei4Xc/p+bBl0yGZ8qwkcZhou1Nc4LPe
 QLl+qhIcdNlKN/tnz2W3RG8HXZuzuF8AqjQQnoEAp2LnUqyoWzjUIrNguHiA0XhAMRDj
 fRq+PBq9WW38aTSGqOFMh4hs1mh7WoZzHkKzHYFw2gwEklZmOLLdM0EMhkibFpcVPCry
 GZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r30gGWM13TxZGi60P97WSudT+FWPB6VdDMnw1EArf34=;
 b=MteZ+18btulNR2xu0dn8kTItHs6b8XYr15l6HL1J2cBEZxGnJFA7OjZ94wRsN0M+mU
 4MA37TbqiAsWquoFy0k8ZfzR6VC89hXCk5BdltC+6gKR/FACVK7XYm/r9tCmfZVOdSJq
 4NzxPMMsUJqSHbkXcJ6DXuN0Kt6YgUrvoiuCBkvrg0rDx3ZCQA3dvKgqmz07/stKz3LS
 TfZRm6FbQM9ZE3K2zjb0z+z0yNgL7L6mN4FbqDGmWcQc8W2369ZytzP4MHQOgtwvoWzH
 eBCYh/9TQ3G+Gbxk1VS7eLp8CMAJ0zukvNl1oIun89+NjV3N+lIzKi4fSZ3ha9ur+r4y
 c/5Q==
X-Gm-Message-State: AOAM531gy/VcUw6sJ5/iIX02rH7PNLulLJSXYLTWt4HP3AEwmKdnXSfD
 aRZo0DI+MO9AvrUYzV3ay/rn2u5tZrEBNVDRy54Heg==
X-Received: by 2002:a0d:cc8e:0:b0:30c:1230:90c with SMTP id
 o136-20020a0dcc8e000000b0030c1230090cmr26361516ywd.469.1654510798912; Mon, 06
 Jun 2022 03:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220601172353.3220232-1-fkonrad@xilinx.com>
In-Reply-To: <20220601172353.3220232-1-fkonrad@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 11:19:48 +0100
Message-ID: <CAFEAcA_YB0-RHib7vUt3Mj3Nf5V0Pt0foqwUoMyMfaN-vhpOSw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] xlnx-zcu102: fix the display port.
To: frederic.konrad@xilinx.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, edgar.iglesias@gmail.com, 
 alistair@alistair23.me, saipava@xilinx.com, edgari@xilinx.com, 
 fkonrad@amd.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 23etcYlVyWyD

On Wed, 1 Jun 2022 at 18:24, <frederic.konrad@xilinx.com> wrote:
>
> From: Frederic Konrad <fkonrad@amd.com>
>
> Hi,
>
> This patch set fixes some issues with the DisplayPort for the ZCU102:
>
> The first patch fixes the wrong register size and thus the risk of register
> overflow.
>
> The three other one add a vblank interrupt required by the linux driver:
>   - When using the VNC graphic backend and leaving it unconnected, in the best
>     case the gfx_update callback is called once every 3000ms which is
>     insufficient for the driver.  This is fixed by providing a VBLANK interrupt
>     from a ptimer.
>   - This requirement revealed two issues with the IRQ numbers and the
>     interrupt disable logic fixed by the two last patches.
>
> Tested by:
>   - booting Petalinux with the framebuffer enabled.
>   - migrating the running guest and ensure that the vblank timer still fire correctly.

Hi; you forgot to bump the version_id in the vmstate struct when you
added the new field. Since that was the only problem, I've taken the
series into target-arm.next and made that change there. I also added
a note to the commit message that this is a migration break for the
xlnx-zcu102 board.

thanks
-- PMM
