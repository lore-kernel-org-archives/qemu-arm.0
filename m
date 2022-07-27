Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp253735lfg;
        Wed, 27 Jul 2022 05:58:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v6J21LiWlWc71Yqk9XTGyECYD2hYHKdo9U0lxlRIbeYEmHHDnriYHt8p3gHuUvEF0H6w38
X-Received: by 2002:a05:6214:e69:b0:474:77:1fe5 with SMTP id jz9-20020a0562140e6900b0047400771fe5mr18736334qvb.27.1658926681944;
        Wed, 27 Jul 2022 05:58:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658926681; cv=none;
        d=google.com; s=arc-20160816;
        b=ol1ZCqM755R8RwFLaN3+80bEMqhcuBPLijLBQU8eaPXI8XohHTIoJXxBPV636QRO3f
         skmvNDQA9duzlCOvBkxQR7ec8f6wbW+63PHQPAlgl4Cv0xmg/8/ntJG3V8o18NyI2ED1
         pO8yc/qRNqeF1aTuiXLlh79gUnFIDEOfCu5c30KCPqcPPzb6GVb4iWzdyZUutyWSREb4
         LQDXU31SDXjK23brQ7HpSnoHEXBbWtk3JiIzIV0TlZ3mI+QVDCITKdK7Vn91khnJSlfh
         oBq+LdukWvOLpN40VDLTvTZ/lyIH9LYjf56RdMOm99Yf3WCjoZswykJ/DWCigedCmFME
         92CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jaILcpFOdNns/9Fm7gsbMoU7wVSdMqpKlfRiC6dW6XU=;
        b=ctL3xvXfVA4JXmXEyXODJKea7lBoY67p9ss58QJC67N0gh3PAFt/VGC4Ti9xLp8jeC
         otWnf7eMCbL6G6VlCR99KioCf8E0XirCW7mhGqeLwTQpyYP0uiBFs96+Xu1t3cX4CO4b
         5vWRnf1QaD8lS41mGj5pszLPcnwEpqhzJGvISM0c1OZin42CehStQ1wYB/ztlWBsbjja
         zkC4WJ4UE5Bv+Jwpq5q7orRPMfr5dNMce5epS5lDaEQifCy0z/Dn93YgqdbKXETHLtuq
         kzSDaNLVOAwFDF+lZxftSwPJiNgmWN2IFZ2WtM1pJY/6Ih6Ri7yELDlB+6iBSEmFFXyF
         w2cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ptk+lRnB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey4-20020a0562140b6400b004747dcdb904si19089qvb.416.2022.07.27.05.58.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Jul 2022 05:58:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ptk+lRnB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oGgbw-0001CF-0P
	for alex.bennee@linaro.org; Wed, 27 Jul 2022 08:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGgb3-00019i-Np
 for qemu-arm@nongnu.org; Wed, 27 Jul 2022 08:57:11 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:42673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGgax-000536-Og
 for qemu-arm@nongnu.org; Wed, 27 Jul 2022 08:57:02 -0400
Received: by mail-yb1-xb35.google.com with SMTP id c131so30038865ybf.9
 for <qemu-arm@nongnu.org>; Wed, 27 Jul 2022 05:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jaILcpFOdNns/9Fm7gsbMoU7wVSdMqpKlfRiC6dW6XU=;
 b=ptk+lRnBLA/lv/TTqgbDM5tZTVueP+I1pJHqrIaZJBmAgxMpsWj1rQ3C23M2BKhH3l
 4ZSHM8DTPWVpP8xd+iw8446Jc9Ud3wvaP64ooh7M7MB3BcuLWiB+vNrT+I9gHxMuDsaF
 iS84h5d+vW6bHkDbSnfW4/Bi6jjxHNBo+pydqysAFt4YzxTMjl8saZ1FtCbSOuKEAb3H
 EGQHlYxi5M1QpMXTWDILg6MsHK4iRGwVQV916a7VWuLCB0uPuPNr6iRMfjc4YQoQ3bVb
 0sSYQekw90MHGR2SxYyMjeGk7Aq/LDy5ZNCj3gJABZPiOhTAQwH1uHKZpP8BodTi+6Fr
 E72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jaILcpFOdNns/9Fm7gsbMoU7wVSdMqpKlfRiC6dW6XU=;
 b=SP6bDwSpyzUs5iPcCQZw9ISmfSiuUbRGNfdxveWpUSJFVU2YO6fLwFF3OSfP0VR8KH
 gJ0ntgDwIU5r4/P+lUzH15p90OqodrVLy5FSYa344hxAq5XTLe4hQz2EUVGzP0S5Ltng
 ancmIlyNSiPPnUnsDrFNsq1/kHik/8XBKXw3bNQVO70nQOZWjOcQgag6xt3iEH48dryO
 20hPGpijX8yDfdsU6ndJczgGaH01sKYDT7GbLDE3kOxrsWXYEUORdKbpEoYnEuTU2LLJ
 9oSzhwKEDDCMBtyYiLu8ydggmI0KKHvVlFdnoiH4LQlOcnolO8a+Gm/RtH9XMKD9xMcg
 nw/w==
X-Gm-Message-State: AJIora+E9NnFU1JQlncMV17YZ+0wzAj2vykfOViLsIgqXBX9WQkKpTOl
 6vhL5YogUgz8LTIb5+riLrHY7Offv4ne47h1sz0dEg==
X-Received: by 2002:a5b:e90:0:b0:671:670a:594a with SMTP id
 z16-20020a5b0e90000000b00671670a594amr9358408ybr.193.1658926617407; Wed, 27
 Jul 2022 05:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220713165449.37433-1-ben.dooks@sifive.com>
 <20220727111320.5b7qobwx5bbwh65d@hetzy.fluff.org>
In-Reply-To: <20220727111320.5b7qobwx5bbwh65d@hetzy.fluff.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 27 Jul 2022 13:56:17 +0100
Message-ID: <CAFEAcA_aw002ZP6a=M5VyjVSs9Ln-Pv3ED0-eTtJj4bFM+KcJw@mail.gmail.com>
Subject: Re: updates for designware pci-host
To: Ben Dooks <qemu@ben.fluff.org>
Cc: Ben Dooks <ben.dooks@sifive.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>, 
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: ukfwDVhDiZhu

On Wed, 27 Jul 2022 at 12:15, Ben Dooks <qemu@ben.fluff.org> wrote:
>
> On Wed, Jul 13, 2022 at 05:54:42PM +0100, Ben Dooks wrote:
> > As part of a project we have been looking at using the DesignWare
> > PCIe host. We found a few issues of missing features or small bugs
> > when using this with a recent Linux kernel (v5.17.x)
> >
> > Whilst doing this we also made a start on some tracing events.
>
> Hi, has anyone had a chance to review these. If so can this series
> get applied? If not should anyone else be added to the review list?
>
> If it would be easier I can try and find a git tree to publish this
> branch on if a pull request would be easier.

Is there a public spec for the hardware? There isn't anything
listed in the source file in the tree. Without the h/w specs
it's pretty difficult to review changes.

thanks
-- PMM
