Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1166421ejc;
        Tue, 26 Sep 2023 08:07:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8Hu51au7GxBBYA35g5o41TiVgoQnxF0tNIGdRWqDyWjWI4S1LwOLdDGumwI2TvheePLwf
X-Received: by 2002:a0c:ca0d:0:b0:65a:f5e3:5ac0 with SMTP id c13-20020a0cca0d000000b0065af5e35ac0mr10562483qvk.51.1695740877604;
        Tue, 26 Sep 2023 08:07:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695740877; cv=none;
        d=google.com; s=arc-20160816;
        b=e/yJn8OFJ3PBiybpKgY+cfrr38HHy1t38zyQ9lFsOqIAyjcbJXN8lyjqHE9NrsP/Gr
         /fdY4oJaD3dY/9Hy0LIrcaqehDxcJcZ3h5ImR9lJ+XGXCoR1qYSS3g7zih9BS710NMob
         tQK417Bs1yC+Oth5mxTkuIyGsGT73ibK5+lyl2JNL8ws5bFnf3/UrxyBmRX9/LQ61Uk9
         Zjsdth4xjRgQECdnoOTzP7Q00ugLPC3ZOchwQa6OKIo72cLZ8Z5YGqy/AXUYKKIlaTMw
         NvC59l4L7cxygg8w/hMP62ZJPdhya7O0EqR8pprkE1Bixa++yZt2C5eGkWVmTWEi4kIX
         /oMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=AGGC/yr1j6jkd471M9xu68/ucoHeEPM4lMgDfHHj9pY=;
        fh=uM169AtInUOucBzgcl/S6Q8QNPD6R9MmBsZljHHnV50=;
        b=cGxz84gj+tRWJasj9ugirY0icxtMJ4vdnjQyRz29dTjNC2syovSVfqMDdY43caFPGR
         PAfmSUs9Wj6tfOHbe/zkYbsqMNHrmY9bsqBJ4/SKvRX4brbdPzcFtpsta5YCIe5xE2Gy
         sXPo/rUeWICqCIkyskXK47uCbgfI0P/RPRLg9tpNxl4tSHwB7Ejxhy0+hCJUsdrf3qv3
         hIJBJY0x32yFKNyycdS8GPpiwTl8oY1t2lvsW6IX5OsMhIgdYcqechmGUHZB7hQQe5i0
         QPEB3yf1x2sG4xwpG/tzU7mR7ukj1pOnK+wEjzHw7fIONqNn7GCDP2ZHG3gVTyTsgw00
         9LbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Bop4BMxS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h18-20020a0cf412000000b0065b26265ae6si747317qvl.211.2023.09.26.08.07.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Sep 2023 08:07:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Bop4BMxS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ql9eh-00059X-9H; Tue, 26 Sep 2023 11:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ql9eR-00052X-MR
 for qemu-arm@nongnu.org; Tue, 26 Sep 2023 11:07:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ql9eO-0003Ip-LW
 for qemu-arm@nongnu.org; Tue, 26 Sep 2023 11:07:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695740819;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGGC/yr1j6jkd471M9xu68/ucoHeEPM4lMgDfHHj9pY=;
 b=Bop4BMxSwa1SOswZLC861eSCH7CT1fst7SAghj8K0OGi3w1bUrZVyw5VmvnCqns9NbP889
 TM+x9RovLadaL6I+bVfEVCFuPlhl/lzDb4StbQAuuuU0RkViGh7GE2oThqz/peabkKZFlO
 hvutBDw0JTtwYSfki004sXFuMTxZb6g=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-ymQ3ptleO_W7q6Z9gfZ5yQ-1; Tue, 26 Sep 2023 11:06:58 -0400
X-MC-Unique: ymQ3ptleO_W7q6Z9gfZ5yQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7740c0e88ffso1604237185a.1
 for <qemu-arm@nongnu.org>; Tue, 26 Sep 2023 08:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695740818; x=1696345618;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AGGC/yr1j6jkd471M9xu68/ucoHeEPM4lMgDfHHj9pY=;
 b=TZRv9fx4dG7W0KX2u6YIU759+65XCjtKw1yMHAQmPIW3wQhc6RWdyWo85NgiNmdYbI
 PjEWA6sjmX6LWJUIS8HvfrSC18kgJX0PcrvktOnkXrLMjzjadTEqQ/vWXyKp3CbHWe6V
 2pldtwCRz9cFv0X0PbkBFSeC0iT4YQ9boektaCAl62xkTZffcRG2XJbRFrTG+mQVnrjh
 SQdR3WflZW5eM/7jevDIVvO+SvHbwwLEvT9Dd8J09oLtxjX0ix8e+cidEZUX507QnI4a
 dg7my3uOAfirvSGOS19NeM/QmuiESAk4WiG4jlPH1z7M8YGc9273Atz9Twj8KsG+Oepz
 BXJg==
X-Gm-Message-State: AOJu0Ywae3Z/d71eM9/KjY0bdwNPgsSI2jv4N8JHZwnxuh5pUanmwYyS
 BruiZnFAVx75/jYKlUBrui230LxNfhuW9JSt1LlpY+3lk2ZUwHANYe7l67ruUEifR/s3D16OXUL
 YRxVyL+EIN2hL
X-Received: by 2002:a05:620a:2588:b0:770:7643:320c with SMTP id
 x8-20020a05620a258800b007707643320cmr11873031qko.19.1695740817964; 
 Tue, 26 Sep 2023 08:06:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2588:b0:770:7643:320c with SMTP id
 x8-20020a05620a258800b007707643320cmr11873003qko.19.1695740817667; 
 Tue, 26 Sep 2023 08:06:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 cx18-20020a05620a51d200b007742c2ad7dfsm2373486qkb.73.2023.09.26.08.06.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 08:06:55 -0700 (PDT)
Message-ID: <ac328c75-3972-ec50-5771-71c5fd24b2aa@redhat.com>
Date: Tue, 26 Sep 2023 17:06:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/4] hw/intc/arm_gicv3_its: Avoid shadowing variable in
 do_process_its_cmd()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>
References: <20230922152944.3583438-1-peter.maydell@linaro.org>
 <20230922152944.3583438-2-peter.maydell@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230922152944.3583438-2-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XBVwhWBasQDZ



On 9/22/23 17:29, Peter Maydell wrote:
> Avoid shadowing a local variable in do_process_its_cmd():
>
> ../../hw/intc/arm_gicv3_its.c:548:17: warning: declaration of ‘ite’ shadows a previous local [-Wshadow=compatible-local]
>   548 |         ITEntry ite = {};
>       |                 ^~~
> ../../hw/intc/arm_gicv3_its.c:518:13: note: shadowed declaration is here
>   518 |     ITEntry ite;
>       |             ^~~
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index 5f552b4d37f..52e9aca9c65 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -545,10 +545,10 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
>      }
>  
>      if (cmdres == CMD_CONTINUE_OK && cmd == DISCARD) {
> -        ITEntry ite = {};
> +        ITEntry i = {};
>          /* remove mapping from interrupt translation table */
> -        ite.valid = false;
> -        return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE_OK : CMD_STALL;
> +        i.valid = false;
> +        return update_ite(s, eventid, &dte, &i) ? CMD_CONTINUE_OK : CMD_STALL;
>      }
>      return CMD_CONTINUE_OK;
>  }
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

