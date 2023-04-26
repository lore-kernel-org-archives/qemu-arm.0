Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp353015ejm;
        Wed, 26 Apr 2023 04:53:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350aKIYRyTF30Uu4Njk9XcwsyDyxr52Bfwj9fcU+ykjar697fpPrAk1cRB5ZAYoOITVhVelH9
X-Received: by 2002:ad4:5dc8:0:b0:600:5dbc:c31a with SMTP id m8-20020ad45dc8000000b006005dbcc31amr33171641qvh.7.1682509980646;
        Wed, 26 Apr 2023 04:53:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682509980; cv=none;
        d=google.com; s=arc-20160816;
        b=db5u3UkPXhxMo5OcgNXoX5gM7nQLJlIvsxCKQoS5e3AkXOylJ6GKP6isuszilGALR1
         bSc82FgrsU7bujkYoW1Jt3eDFNCjZyPaISMZJrOtQfmmOcBhV5nM5Lf1z5Fy2I9gkQbF
         wiNyzNM1GGmM4B54jdIsqYvLV15yG9DtDnS7FDS59mNg1GntUtDv24sXBV4WO5lWj9ve
         x6NCZ8cLhYwcbKQ4xDdFwv15ijxaLPWfCO68K+qTv0FzCyUXm0OVLCe5twSxPILlfb4w
         1+L+DR9dDAKXG6kChPBVf3lLmb3e9xidsbo575GstahOa/U/cCcxze/u7CFP1UXryMZO
         BHDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=ndAtHpJW5J8EYg1Y31h074kjS64zxIpxow1wLB8Qu18=;
        b=an0/s0XM8dZkOUwLke/ngdzJf1iut/+KHd8ZFNkCCnXCcmW0pPBDikYN4lr1YW6Hhw
         UI7v+ci/WRR2vDrxeyUZK6iCV6I+OcZ96OTOdA4bzos7QHBN+rnlpHmY1NGpNGF1KeME
         C0nATU8VdzmmIyIOBO/SQzhLPBxPljZXnpG9AspngGikCbRmdjCnToa/06x69qGOX8fk
         PSZl2Xzs03+EWJNakCSL1UfhkbJE+CF7Jd88ZaqSP+I9SHrlqsHH4yPKtkJv1YBn0ubf
         v7F5BpzW6MdH6fKaixfszTp9i23S5x3i5EqeinhEGqqGBO5c9z+1xBKm0fQVwoa1QX4v
         0GVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20221208 header.b=mAwXWacn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=acm.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o203-20020a3741d4000000b0074e0dceb02esi9525881qka.8.2023.04.26.04.53.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Apr 2023 04:53:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20221208 header.b=mAwXWacn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=acm.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prdha-0006jz-CM; Wed, 26 Apr 2023 07:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1prdhZ-0006jS-Ng; Wed, 26 Apr 2023 07:52:49 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1prdhY-0001Ky-7I; Wed, 26 Apr 2023 07:52:49 -0400
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-3ef5bea20caso25075401cf.3; 
 Wed, 26 Apr 2023 04:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682509966; x=1685101966;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ndAtHpJW5J8EYg1Y31h074kjS64zxIpxow1wLB8Qu18=;
 b=mAwXWacn+KZVfLUIL3Bu6ZZAie+u29hK5wjIejOCDLhu5oEYpJdrfQe7r5pqxBV7Ww
 00K07ebDval1g9xWaxC2VvGhpABSro/t0pabt1IOsX9J3sNNBXhpmYes2kf66NUp4tY4
 L7J609NFlK/aTp1BuwLua8JSsqDa+sh+jSlGxTJ+xRKz3GvwlZ2aWIjrTmbJEDd+D2If
 lMfQ+kC2pMewnjXQkQKYo4PcgYudrAVnuAHoGWkXULVHoSwLt+onLT8gS/yCKgevGAje
 r3KVxYHBXh90usqo8aHQ3ELsra8Bv3PSBd5HiL2LJCAAg26DFe/RGLcIwjc15IKeYVo8
 R6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682509966; x=1685101966;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ndAtHpJW5J8EYg1Y31h074kjS64zxIpxow1wLB8Qu18=;
 b=WrnYDsqBQnik0dptt8WAd060JfWpIpj3VKvPtbeZW3n3y7CbtOOQo0D6HFSbJLa6p7
 gjAicEmUYOmXdmR3O8zKmLA0l23AS77Dp3nL3Yuah/MR+zNB/TizaNKZzHl6QgkoVtJB
 0uIXl7kWXxLFwfvnTYUONaZ9hC8Ke0wgR3Vm45Ni1fD9tefBBeegAfZkQgfEwS2ioYl3
 frLLxfESKPUwpvPw0bqwPlc4nsajIZH1CzNY3izfCEiEQdSX4hW/anJ0HPQyEPSssrMr
 NtGK7rDGEBIx7jM4EBnIlma+Li1WsrkOK6AVPtGXGtkV3i/76y/2Xn2eVDq0M1jPhY/7
 1ClA==
X-Gm-Message-State: AAQBX9e2b1zqqc1qhAwli7FQAQTSrPPbkN9VgEEPj5vvF+OjrNQpsReH
 LXPklmAGqDYLiJvc3Z+CtA==
X-Received: by 2002:a05:622a:42:b0:3ec:45c7:33be with SMTP id
 y2-20020a05622a004200b003ec45c733bemr34251120qtw.42.1682509966018; 
 Wed, 26 Apr 2023 04:52:46 -0700 (PDT)
Received: from serve.minyard.net ([47.184.185.84])
 by smtp.gmail.com with ESMTPSA id
 r18-20020ac85c92000000b003f0a7c13fcdsm1835083qta.74.2023.04.26.04.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 04:52:45 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:772b:130b:d11f:1565])
 by serve.minyard.net (Postfix) with ESMTPSA id 0A8EC180011;
 Wed, 26 Apr 2023 11:52:44 +0000 (UTC)
Date: Wed, 26 Apr 2023 06:52:42 -0500
From: Corey Minyard <minyard@acm.org>
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, Corey Minyard <cminyard@mvista.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>, qemu-arm@nongnu.org,
 Peter Delevoryas <peter@pjd.dev>, Keith Busch <kbusch@kernel.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Lior Weintraub <liorw@pliops.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Matt Johnston <matt@codeconstruct.com.au>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH v2 1/3] hw/i2c: add mctp core
Message-ID: <ZEkQiqt59Hn0vjt1@minyard.net>
References: <20230425063540.46143-1-its@irrelevant.dk>
 <20230425063540.46143-2-its@irrelevant.dk>
 <ZEfvkWCbJoKGIOnT@minyard.net> <ZEjOlBlEH3KH8f6d@cormorant.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZEjOlBlEH3KH8f6d@cormorant.local>
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=tcminyard@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UmrzR6dJOb98

On Wed, Apr 26, 2023 at 09:11:16AM +0200, Klaus Jensen wrote:
> On Apr 25 10:19, Corey Minyard wrote:
> > On Tue, Apr 25, 2023 at 08:35:38AM +0200, Klaus Jensen wrote:
> > > From: Klaus Jensen <k.jensen@samsung.com>
> > > 
> > > Add an abstract MCTP over I2C endpoint model. This implements MCTP
> > > control message handling as well as handling the actual I2C transport
> > > (packetization).
> > > 
> > > Devices are intended to derive from this and implement the class
> > > methods.
> > > 
> > > Parts of this implementation is inspired by code[1] previously posted by
> > > Jonathan Cameron.
> > 
> > All in all this looks good.  Two comments:
> > 
> > I would like to see the buffer handling consolidated into one function
> > and the length checked, even for (especially for) the outside users of
> > this code, like the nvme code.  Best to avoid future issues with buffer
> > overruns.  This will require reworking the get_message_types function,
> > unfortunately.
> > 
> 
> Right now the implementations (i.e. hw/nvme/nmi-i2c.c) writes directly
> into the mctp core buffer for get_message_bytes(). The contract is that
> it must not write more than the `maxlen` parameter. Is that bad? Would
> it be better that get_message_bytes() returned a pointer to its own
> buffer that hw/mctp can then copy from?

qemu has had several instances of unchecked writing into a buffer
eventually getting it into trouble.  It might be ok in the beginning,
but as things change and code is added, something might come in that is
not ok.

nmi_get_message_types(), for instance, does not check maxlen.

It may be borderline paranoia, but I've seen too many instances where
paranoia was warranted :).

Plus I think it would make the code a little cleaner and easier to
maintain.  If you wanted to change how the buffer worked, trace data put
into the buffer, or something like that, all the code to handle that is
in one place.

> 
> > You have one trace function on a bad receive message check, but lots of
> > other bad receive message checks with no trace.  Just a suggestion, but
> > it might be nice for tracking down issues to trace all the reasons a
> > message is dropped.
> > 
> 
> Sounds reasonable! :)
> 
> Thanks for the review!

Thank you for the submission :).

-corey
