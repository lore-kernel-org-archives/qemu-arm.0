Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp700655lfm;
        Tue, 7 Jul 2020 00:42:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOKaGsJB0RfyfJFn7jjltk6jqayOxlwFH8WLUCKvWtuxUB7IODKwut4IXZlcX7obTz/Rz/
X-Received: by 2002:a25:bf8c:: with SMTP id l12mr91357164ybk.447.1594107761158;
        Tue, 07 Jul 2020 00:42:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594107761; cv=none;
        d=google.com; s=arc-20160816;
        b=mmSSHJKvqI6cg0Lr+k+3WYbznYjLoj5/RzXxMBU29MVaD6RfPfDPN1T3cH+Y+WYSHQ
         TpzaYL7lrh4NIUJRJZMpuvdHxcgWI3qFmUKyhg6/j9NdxPrVUj44bImllrFsHAC70Dtv
         yLyXH/qaRU4Cgh+Yqr33ZHMWn6q5stjbo91OPCF6iEhTsowCOuRm97P3VKyOEpW46Mo4
         ILq+57Jp9OYym+qVGcetLpG0EulWETT7s9xn6QEp3L3kRT4Y5scbhdWAF5FmYAWZ9Yiz
         OqWRw50pYOnabI/0X2z5K/x5LB0K6w3IPoPOVREEhHjDaXUrKuCYv9dtvMacKVtEgLzg
         eeUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zgfF/l/rk7YSQrdjF2U4TIyp5uPO4bxgVF3D6F9XBR4=;
        b=s8qslIlC5kE0b0NyWLkm8pEEVs+r9QbG2b/WdVK9wOgWl9z2LXd/+ePb2BQbL64RV+
         4XTfEdnzPuzDOy+pwHkyXpchhF/SleWAbfFNNPnYEiJOoy2RpVofaHwwmH6mi8a7dp5q
         9Cck4SY+y6f8xXfIjlL2oJkeamVHcRi5k33kqJXYihL8R8uVzV0OCzJ59y7+aQ5NGMU0
         V0nJbAGvWx66BmwPmZM6efJeDaBRoSPzuHiWnfKEWE7puA2fGaVeZ7NNVYn/jbRdg/HH
         tBG8ti+z4md5AC7GqDxI4WfXIxR5eFXlQHwpyofkihTOCLzroScgqbiZ7pW+qFiCKipI
         zDKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="ZIi/WQi/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d189si13227673ybc.197.2020.07.07.00.42.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jul 2020 00:42:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="ZIi/WQi/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsiFU-0001Hc-FC
	for alex.bennee@linaro.org; Tue, 07 Jul 2020 03:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erik.lucas.smit@gmail.com>)
 id 1jsiFM-0001HQ-RH; Tue, 07 Jul 2020 03:42:32 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <erik.lucas.smit@gmail.com>)
 id 1jsiFL-00013n-Ak; Tue, 07 Jul 2020 03:42:32 -0400
Received: by mail-ot1-x342.google.com with SMTP id 5so31626021oty.11;
 Tue, 07 Jul 2020 00:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zgfF/l/rk7YSQrdjF2U4TIyp5uPO4bxgVF3D6F9XBR4=;
 b=ZIi/WQi/kJgOTXwWCqw/uXrnv5NumG6M8oBE1ogTVeQjXHAsrO6/9hCEieP+byHPfi
 X2zkzqd9HX3xwhapVHKZzAzLqCx366na34Nf/F9zdnetGpGAdKCVCC9pjbPDCslnSo4f
 xQsfvQqvDoPKtMa8yvVPiBtEAETz6HmPxNszwz6H4yi8Ta1iiPhHWkoRG1lnSs07WACH
 Y9tbUE7f5RHkl38W+kSMziCRLIXWi7zDta8jAr430yLBOQ2EAnB1/r+NBcaUlc+NasKK
 qE4piQYO69bibqSD+tF8MeQEORZuVKhw2eTGBuvEDTbRN1trNn3GNjtyI+ykGx1P2L0e
 rnpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zgfF/l/rk7YSQrdjF2U4TIyp5uPO4bxgVF3D6F9XBR4=;
 b=Rr4YuoJA/r4pvwVBxclZ/mcsxMEb0Y9qWnJbV1ojTDGj5M7ncgUelSXl8Y+y/YsQxi
 tGj0g2oZ1i1tHUWKDG6OmCDOoPfQh3dPupQG+A0rTaNqYMv5o8EneTpzcISngpK7GXvN
 yc+/sfxt0Re24L6JJcSrWatO/Y48rcJS5OzkJ5iqXzTCudzpB6GqOeg4FfJx/WPuJfln
 Q8iHTqYfR5T4ZZNfAPW0AzIAZgjwFRfpWyqoV93a3IcbTRkTFKBstX830ITZ+LzU8kcp
 vNyHjg0Ds0olEEFhCaYPqwlZxttw8ZsvQm4JuGA5GRKQGm4iiM9eT/sAgzz+lrRtyL3U
 bn3Q==
X-Gm-Message-State: AOAM530qvpfoauCgnI40eJgw8qKJGApWiB7GJDgefI68OggTJS4uRpmE
 xZcjyn+7NxqpZUjyQN3eJWCtgETAPfqEyUsVCCo=
X-Received: by 2002:a9d:2067:: with SMTP id n94mr47106651ota.78.1594107748832; 
 Tue, 07 Jul 2020 00:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200628142658.29264-1-erik.lucas.smit@gmail.com>
 <df64d8de-9d7f-474b-8b72-5d2e6c7df1f4@www.fastmail.com>
In-Reply-To: <df64d8de-9d7f-474b-8b72-5d2e6c7df1f4@www.fastmail.com>
From: Erik Smit <erik.lucas.smit@gmail.com>
Date: Tue, 7 Jul 2020 09:42:19 +0200
Message-ID: <CA+MHfovCuasf4RrfZrJwfHx4VOeRNfQ=MTMaFG4=Df8cELZ=EA@mail.gmail.com>
Subject: Re: [PATCH v2] ftgmac100: fix dblac write test
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=erik.lucas.smit@gmail.com; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h1nVTOEd1eG/

Hi Andrew,

On Mon, 6 Jul 2020 at 03:59, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Sun, 28 Jun 2020, at 23:56, erik-smit wrote:
> > The test of the write of the dblac register was testing the old value
> > instead of the new value. This would accept the write of an invalid value
> > but subsequently refuse any following valid writes.
> >
> > Signed-off-by: erik-smit <erik.lucas.smit@gmail.com>
> > ---
> > Changes since v1:
> >
> > Changed %ld to HWADDR_PRIx to fix building on mingw
>
> Bit of a nitpick, but the type of the value argument is uint64_t, so shouldn't
> the result of the expression captured by FTGMAC100_DBLAC_TXDES_SIZE() and
> FTGMAC100_DBLAC_RXDES_SIZE() be printed with a straight PRIx64 rather than
> HWADDR_PRIx?

You are correct. I didn't understand the meaning of the PRI macros and
just grabbed the other PRI macro I saw getting used in the file.

-- 
Best regards,

Erik Smit
