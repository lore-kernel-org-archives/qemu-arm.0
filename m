Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp6679756lfc;
        Thu, 22 Jul 2021 06:29:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxi4ywL/Lejp0oE9DRjCcPEi0RP4W0or1f+AK3GqCGtv+zdd03BZO2jNBcHh37zioojW55e
X-Received: by 2002:a92:b003:: with SMTP id x3mr27910079ilh.93.1626960560375;
        Thu, 22 Jul 2021 06:29:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626960560; cv=none;
        d=google.com; s=arc-20160816;
        b=jRwVHP9NLNO7mETsBXygd1lGRM6xq8RuYxkwxs/lXoJSmOMDqxfI6vhVD5bc4OMvj5
         2d3a26oAi+4CCHtkQu4DDVQyWr1PKzp1T9vZFOhqUEHkRc2aG23L3lmKiTYf6YtO4Pt2
         hX/3OCQAFLvTEZ6X/93BeIpUok8t56snZG+J3jGduOVbyHkMbQ+fAitR79NLXDWahLUm
         8/rokMIis/F05TRCqjftkWgja/0OYb44kqICg+TCk/xoI67iExhazbFlmED7Fh3Ma0fP
         liZmEvEuw4E28redJrPl4mR6XB/86m3CNKgTaYhdzuqdufzKttndTXA4UQsiqvnA9LiS
         J42Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HB3fjmBy+2S0/yWo6feEEIcp9TK6xEjDwv2/H4f8XCU=;
        b=0/0tQmotFm5vbB2woaPQzkP3nUUaaRPVNY3rRZjYxRRGD3ekhkfnUNRcQEsmF/y8rd
         7TGGSwIyo7K7aJFAuj/b6dtkz6sN3eWRrLsyDrXK9ja/RYsUqpoyV6v0WsmPv5p266gT
         9Lm+RQZ13BS3vW0NF7KDQc93x7HKTYTwHZubV0CLt8QTRoqjyLhYT/h9XLTYAhiNXZxI
         tTrxufE86JXUk7AlRhfBRcJhirWhdjpvW+21eeQ/guLyHYR8UjoMiTkSuUbpBtEw30/k
         SEcBXUJfpoTe126xsdGtVpDuW0C/mY8uTcdTKhPLHP7F45Y3wH2JCDjoG0IMCJg2dTF7
         sFQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Fu6i+Mnd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o18si31557254jat.46.2021.07.22.06.29.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jul 2021 06:29:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Fu6i+Mnd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6YlL-0006sv-Km
	for alex.bennee@linaro.org; Thu, 22 Jul 2021 09:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6YkL-0006LL-4T
 for qemu-arm@nongnu.org; Thu, 22 Jul 2021 09:28:20 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:37415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6YkJ-0003sA-QZ
 for qemu-arm@nongnu.org; Thu, 22 Jul 2021 09:28:16 -0400
Received: by mail-ej1-x629.google.com with SMTP id hc15so8401333ejc.4
 for <qemu-arm@nongnu.org>; Thu, 22 Jul 2021 06:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HB3fjmBy+2S0/yWo6feEEIcp9TK6xEjDwv2/H4f8XCU=;
 b=Fu6i+MndvDS6hdYz2VC4EARW6i1Vdx7yrKOXWY0ihC9MtaWWoJy9g5UlIEMeSA4DBP
 4YJOuAJWi4T3qnyK0OGIqduxZPH0NIaKkrPrt7Kz3BK+rUepkNwY4pROED6xyZ4KPgwG
 yiyteSN9VuPX9KCVWvShLDkSdUWtDzBrzT1TpIUf775yxWXMa2tfC72srYjoHSyQpVAL
 Dg7lKY2gO8ycYDNRi+TilsCK2AF4HpApU6vgmwcfbG8qjYUq32xyBlM/LcIE6wFA37g/
 xC3fOKylgRgwT0XclP6guiwaHWBTtzVUpF4ZZfmt+pKVv963q007arAdu7aEddVTUxuR
 GiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HB3fjmBy+2S0/yWo6feEEIcp9TK6xEjDwv2/H4f8XCU=;
 b=q784kTReDkPG4wlMihHKBNnH38Q33lPkEUWP2wn72slIpG2/Olr9PFDasmNp8AKops
 DERHiIddd/JCCh+VItnL2rcFz2utKnSFJ0SaWDSQghele2t0gkY11vX5cHJFaeBPr0WP
 hNK4VsrxDaFhl7YdivbULGet06kCgLftM6lHsxNGGwRcGNqjiykjzOvJv93vpUO5opJP
 vRpiRCuzzUHdpJmLR+5fdsEnMsRiWPErFqy7X8Skvin+CN5xx9lXXKw6AWIpp9yJbWJx
 wsImHw7lEkrYy9mt2JEzwB/vvDuhT4Nhhn6CKkoBeA9KC2lXr4MUr3x8ytggtTVZCkyw
 UFzg==
X-Gm-Message-State: AOAM532S+oBlfl9KRNbWcTLYUspUCaT1MfyZ4RLQsQGIAhecxEJc1nad
 JL2HfARqYmKQhaJRm6cVFqupX9fUhwlWSlxuLVV7bQ==
X-Received: by 2002:a17:907:3e02:: with SMTP id
 hp2mr42953283ejc.4.1626960494343; 
 Thu, 22 Jul 2021 06:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <ef4df56d-5b60-99f1-fec6-fe2e62434d3f@huawei.com>
 <82c78e1f-98ef-982e-fbcc-34da6b8aaad7@redhat.com>
 <91d179e0-8365-e3b4-cee6-d05ce918a32d@huawei.com>
 <1d9123e9-705a-36ef-3286-b2f347ec5894@redhat.com>
 <5ccf2a18-0615-8f1c-47cb-163f80037feb@huawei.com>
 <eb63f96e-59e8-55cb-d8ba-119f75ce032f@redhat.com> <YORmWw4MUBV+VTen@work-vm>
 <fc630856-cc51-4830-9f85-4cf89e632819@redhat.com>
 <87fsw6ebaw.fsf@secure.mitica>
In-Reply-To: <87fsw6ebaw.fsf@secure.mitica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Jul 2021 14:27:33 +0100
Message-ID: <CAFEAcA8TjHHoOjOn_iyfKRNVpHYQTa3Mg-o9tfXCErDEYtUWDg@mail.gmail.com>
Subject: Re: [question] Shall we flush ITS tables into guest RAM when shutdown
 the VM?
To: Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Shenming Lu <lushenming@huawei.com>, Kunkun Jiang <jiangkunkun@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>,
 "open list:ARM cores" <qemu-arm@nongnu.org>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2dR3MoE5CagF

On Thu, 22 Jul 2021 at 14:19, Juan Quintela <quintela@redhat.com> wrote:
>
> Eric Auger <eric.auger@redhat.com> wrote:
> > Hi Dave,
> >
> > On 7/6/21 4:19 PM, Dr. David Alan Gilbert wrote:
> > That's consistent with what you suggested in the past ans what is logged
> > in the commit message of
> >
> > cddafd8f353d2d251b1a5c6c948a577a85838582 ("hw/intc/arm_gicv3_its:
> > Implement state save/restore").
>
> Hi
>
> Ouch, it is really a mess.  Why do we need to save it to RAM instead of
> saving it to anywhere else?

The ITS tables are in guest RAM because that is how the real
hardware works, and so it is also how the emulated version
has to behave...

-- PMM
