Received: by 2002:ac2:5fa8:0:0:0:0:0 with SMTP id s8csp12093lfe;
        Thu, 30 Sep 2021 00:11:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymhuCSJp0ANkotyZxrZHFSWRruRShYA4ubmpDhzpnQtJqR6wC+1Si/0Z1NUfvbMYf4bddq
X-Received: by 2002:a6b:da16:: with SMTP id x22mr2641118iob.175.1632985905247;
        Thu, 30 Sep 2021 00:11:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632985905; cv=none;
        d=google.com; s=arc-20160816;
        b=xGvWzlglvfHam/e5P8Go0Rl3NU9lXzXFTWYoKzQWjxb2sjJzm5Pi/ypFoFK8bWiWfV
         DGBCaOaVjdnK8+U+Ur3m6GVxSl3V3hywkfeveXDl3VpYrK5N3A5MYo3P5RoES1SkGWVs
         EaI802AGW9mocGcxQC4J5OpOTPSOR9ceN8mkoIs9V7Ik9htzzLYUC7QRJ3IJ8e4kw2D7
         oopvfEUXHxJuyDTKJDfpivwNdz0R7ZXpbcbrrv1r3LWv4eqNSIzYqiU2nrOKqegUtoJh
         K9JU/uYElJ73pw7J191kSj7Rg5HfpX42FIs08xdWIth230hqeGRMblSdS3su3zUtlQZy
         bc3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=CpeJKOyXPV/ossVffDS+z/ygYPA18wI+XGV85GMATj8=;
        b=blsZwSoKrseUeoBdEtkctfXMyb4/6dIFLN6Xjtv4OM8bTkGznbgly8KohadNEIshB5
         /+brgrXgZsbV+4H/uj4CCD0ELqwiaWNRxRqZwBCxTBQBRvPtLVm16gBLnYmC3AIhgFJv
         Puvz2ArcoxIo6t/qVwxBNDPeTC6n5aaTHtG0ccpPt6IRL8KryAxgLrJ7LbGJq04sVRME
         RQBBRqCXgiQgMX1HkEowqBZKfWo4JKOg0Sm0qk8o9LAOv1yaJxjHX93GiUAXqtEIZs/h
         PSJCjZA/TAKAVqqs1QTme6FYzDxiZ57ViWXSTNmjM23l8v5wYtx0PMJ2AP5g4W1McUXW
         ejbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="EC/bAodq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x11si2296932iom.45.2021.09.30.00.11.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Sep 2021 00:11:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="EC/bAodq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVqEK-0001jr-0d
	for alex.bennee@linaro.org; Thu, 30 Sep 2021 03:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mVqDG-0000NO-KG
 for qemu-arm@nongnu.org; Thu, 30 Sep 2021 03:10:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mVqD0-0007Hv-L5
 for qemu-arm@nongnu.org; Thu, 30 Sep 2021 03:10:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632985819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CpeJKOyXPV/ossVffDS+z/ygYPA18wI+XGV85GMATj8=;
 b=EC/bAodqS2LmYFcGWb0UvE8LgZj/cT4478GcRcdcgT3ge5iKOIfupovexTsj5nWWHfcoYf
 +DkyLbpUriq3idLS1wDLWUYErf7tMpsvj+2QFoz2I0S8GGomVUUGtjapVXGQq2VfNVZHom
 kJ64v0VfeeoQOP2DEo/1bLNpdgR4kOg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-f-5fCYxiMmm8A-qRC7PizQ-1; Thu, 30 Sep 2021 03:10:15 -0400
X-MC-Unique: f-5fCYxiMmm8A-qRC7PizQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 r7-20020a5d6947000000b0015e0f68a63bso1318601wrw.22
 for <qemu-arm@nongnu.org>; Thu, 30 Sep 2021 00:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CpeJKOyXPV/ossVffDS+z/ygYPA18wI+XGV85GMATj8=;
 b=zZ2EjJ4923f+u12R+XD6YGSyPYH/vXhDKDG+66dfHRu3b1QSiujHV/OvrYLqBmoxkf
 HQRCADiUvSUjizXT05Xon3eRAMS2OrHA34rVhhNz52hEEiVUUB+Gl7cpbM4bdtOtlvn5
 smvCt2Ayxo6kwDRw1ZL2NHoLH6MFeJhL+V+l1gQtXyqDOTLutGSOvkokIZEQcjy+TI2h
 D3cnxZZERRNXpVH9wtynhTxThczp1N9O8Ak0eE6k+lsLUuSCkDiAME8ye0SjKt2jn/Zg
 2ib9/FGO4Eb/Ge0UN0iebxQrngVtcjCsj3vWD6bSldc8jWjsmDsm+CHTrlnlvLFUPObe
 9Scw==
X-Gm-Message-State: AOAM532SI1PmbRom2DQ7hNCr0hHdB92CTQnQr9x2UC/LrTgzYjiDecUF
 ZWN+BzQH9YFi51s/KsjCEivgahcb1XW6XITXSjD4RKNqsv7ZvlWITXGInx6sJXg3KSmklAa1D2C
 +DyRLABV+YsjH
X-Received: by 2002:adf:fd10:: with SMTP id e16mr4301096wrr.377.1632985814385; 
 Thu, 30 Sep 2021 00:10:14 -0700 (PDT)
X-Received: by 2002:adf:fd10:: with SMTP id e16mr4301066wrr.377.1632985814107; 
 Thu, 30 Sep 2021 00:10:14 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id e5sm2091434wrd.1.2021.09.30.00.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Sep 2021 00:10:13 -0700 (PDT)
Subject: Re: [PATCH 3/3] dtc: Update to version 1.6.1
From: Thomas Huth <thuth@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>
References: <20210827120901.150276-1-thuth@redhat.com>
 <20210827120901.150276-4-thuth@redhat.com>
Message-ID: <7004c933-5262-3119-80f5-722a8e858046@redhat.com>
Date: Thu, 30 Sep 2021 09:10:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210827120901.150276-4-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.03, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZY/A2YR0/D7H

On 27/08/2021 14.09, Thomas Huth wrote:
> The dtc submodule is currently pointing to non-release commit. It's nicer
> if submodules point to release versions instead and since dtc 1.6.1 is
> available now, let's update to that version.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   dtc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/dtc b/dtc
> index 85e5d83984..b6910bec11 160000
> --- a/dtc
> +++ b/dtc
> @@ -1 +1 @@
> -Subproject commit 85e5d839847af54efab170f2b1331b2a6421e647
> +Subproject commit b6910bec11614980a21e46fbccc35934b671bd81

Ping!

David, could you please pick up this patch if you don't mind it?

  Thanks,
   Thomas

