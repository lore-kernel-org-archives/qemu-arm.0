Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1377215lfb;
        Fri, 27 Aug 2021 01:58:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5/ln+zSdwBF1yUdunmVz9lspCW6TvJ63tS7KMGSukjMwS4u23pAdsjiqbVfvV6SW8ekcM
X-Received: by 2002:a25:2a90:: with SMTP id q138mr3810728ybq.379.1630054724520;
        Fri, 27 Aug 2021 01:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630054724; cv=none;
        d=google.com; s=arc-20160816;
        b=j99Q2iKbZVhhPqFswL1CgAFJtp7ygxnVRg8sTQPvrr0C1IyUKeS/QhZ1KrdbATX9DS
         tExb/8lNRSCOhxr24bLbtsg8fWq2/vCFvZIj/eBGM4XU3CnsFXtGqffLx5Vm/aJp02dN
         8QIt8FANRxLTA27Xltl2BwyyulEJBHd4tVwpJ3BYIQ3jEtkd0Wy/TYBOc5YI66CJ+KfU
         WKMc5jXCFQUwmXVc1eYTyRjOLA2e+VPIiW3OVtjQcwnp02KO9F1YuHzRb2ZmU2y8hZME
         Pj3HkFoCSwseSmsH3zqsIUDWFGwDxD0vanrT8huqMpIjLybEpVhBGNcwqnuyeUtae+2Z
         awQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6cuKneKC0Vu4KQCam5NfpdSavPUg5ZqIlZ4ojR40kXU=;
        b=vM6l2batYqdeQ62ate6dUH8G8Dyo/xMPWBlnvhPY32ywo0I/HfnY3HkmVKaQSvY8jy
         eU8BJppyWKBc5yCb8tFfdSr3xttfdvykwKE3VtZC6hdfJzs3DISGORXuaE+IAEDXvVMQ
         FPjYDGx0jnm4x1di38YM40fBpKSOlqtI1F2ymKBlFnXF20i0mzJW5m7pfLxOU7jSZOkG
         e8f4xL3OdWi8y0jzWLszyc69p38ZeXGV4u5aIKYk74IO9iAScXDLG5Lo7Cs5jWZMrQmQ
         VuEv/GlItbStgi6GVzT4xKH/qn0bCaedUIJM9SW9c16CSSxjMkabayoChsSK85Aj2cpM
         zIEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NjSTCnmX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d133si3185130ybd.142.2021.08.27.01.58.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Aug 2021 01:58:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NjSTCnmX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJXhD-0001sc-TX
	for alex.bennee@linaro.org; Fri, 27 Aug 2021 04:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJXh5-0001sM-Hx
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 04:58:36 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:44813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJXh4-0005A1-69
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 04:58:35 -0400
Received: by mail-ed1-x52c.google.com with SMTP id n11so8857823edv.11
 for <qemu-arm@nongnu.org>; Fri, 27 Aug 2021 01:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6cuKneKC0Vu4KQCam5NfpdSavPUg5ZqIlZ4ojR40kXU=;
 b=NjSTCnmXyLavO4jDs/RxNxcxhrkI0DnfJR/Skjhw49FFRg5vfEJ50jSjdl4eAuL48i
 UajteFEp3V50DWNajJ0TraH1xu+MLfgf0yik21YD2cuqWLIh5B8Z/MlWo+POsMN8ydGN
 Y4svZ6nDUVjEZXf4fenMry05LBTuGSGijlsIhw5e1wSZRfHdpZkGx4qtUnLuL5suSBsE
 0gBwrFWW2RTIZVB+Xd0G0cOZkB1QK22+vknyu9BX73DOfTKk3jK7PMV7p1R9CiUaZ1Yq
 AE57hkmwdVY0gSz+zC+TPJo+N7ahBnzFLE13yBldApwnmv0byOHpD/SctKg4a6TFxHHG
 zUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6cuKneKC0Vu4KQCam5NfpdSavPUg5ZqIlZ4ojR40kXU=;
 b=KNp3wBQokd700Ou2+WVDOYzt84Dn3nagOfcu27GIr7tahczsQc3jGDwpXO2wjrDHR5
 I6Ixtmtu5W2d+j0EuypWeIkKIG5OjPQqMBB0f9UVC2gR/OH1PWOosHTugZJaleYMsZkz
 rzK8WrzJ9yovRjWEmbgIadw0K2oZG+I6ZzmxOf6y3Vh3WF5V/OSVGnHYq6TZe0dVKHQD
 vJZBulZDDlq255XU7p5SuA/iOKhaJSJ42D+qQXnf7tbxzTSyjNjicrChlFBDbKSdBMvF
 EAwNq7P++6z4urwEa/JWXEDdnc+V5pvG5vdWl380zExoARYLZzTf0APH6V8oq6iWBLpI
 dtFQ==
X-Gm-Message-State: AOAM530K6pUGy1At5+h7XTDI3fBivwBw+q4XgYbRULmaKlwfdg/jbLvv
 /LNVOb6H7eKNSY7ks9v+2VUNIbgpsLszHTHJKKfj0g==
X-Received: by 2002:aa7:dd48:: with SMTP id o8mr8699486edw.44.1630054712577;
 Fri, 27 Aug 2021 01:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210823160647.34028-1-drjones@redhat.com>
 <TYCPR01MB6160D6A837EBECCBC1F70847E9C89@TYCPR01MB6160.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB6160D6A837EBECCBC1F70847E9C89@TYCPR01MB6160.jpnprd01.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Aug 2021 09:57:45 +0100
Message-ID: <CAFEAcA8WFYAddXZ+BScb6+jJNnmKM+zV0kdHgySgZOV_+8BaQg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] target/arm/cpu: Introduce sve_vq_supported bitmap
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "philmd@redhat.com" <philmd@redhat.com>, Andrew Jones <drjones@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nlW3LjYVFUUb

On Fri, 27 Aug 2021 at 09:30, ishii.shuuichir@fujitsu.com
<ishii.shuuichir@fujitsu.com> wrote:
>
>
> Thank you, Andrew, for creating the patches.
> And thank you all for your comments.
>
> I have applied the suggested v2 patch series by andrew locally,

FYI, Andrew's patches are now upstream so you'll be able to base your
next revision of your patches directly on upstream master when you're
ready to send it out.

-- PMM
