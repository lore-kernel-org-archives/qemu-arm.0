Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp853373wrs;
        Fri, 23 Aug 2019 10:32:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyBkNH4pejt1zclZqn/3RaaKWswkQwf/SOlWCD2V2CPdVyRc1vDfFD+RcJQwQj+9YUtXsgL
X-Received: by 2002:a37:648:: with SMTP id 69mr5294153qkg.248.1566581561567;
        Fri, 23 Aug 2019 10:32:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566581561; cv=none;
        d=google.com; s=arc-20160816;
        b=cpU0cYWAEgNfS/UpZALZ0WUFJHZbDVsL/xShM4m/4CfAigWpBy1IIutjGpwvtN3Ikv
         JymOTbTxqfALgSWygABEbrTpp+edtMmEL0x3fAo2m0k2z6pmTHPF/JJfOYywoEXe/qc5
         1+jaXwhFQnUCKsS5aW4y4TYvV0lyaWLqyyEZ6XmfwJNQa7EjZ+7hOSn440tDto9v9KQL
         Hf3YNseuuNXY+PaG2v+gXiHXwR5HghQ6vpFibirsVaVRLJH/I+H2AK15KIKFDgn7XBOq
         jog5HonM4SVREk00hShGCtuuukWAqmfzWIzOkbc50KN2cGIzIhGlIEKlLD/MuWIqvOx6
         QPDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=V/AjrV59P1NHShm5e2W+azDxhSKVmZ9Ld6wDgXeXJxw=;
        b=AVrVEko9mmuNDT6f3/m62jiW+GRmrSsXStmpErTZnvBQ11fU68XkSa1VnteuUpIsuU
         sYAME+RJbSnZxG/88caGL8F+7yxCNSKkESpolO4Z/m9RcCY3bDwMQTyUKTp/GpaL9oPu
         aWpsvI8TBoQffai2Qz5YfmHaCx9/rXvXuh1QpM9Mr9kOe70YHCv6eL3YlmtVDm9vn6pR
         pMsdIyGGmsGMXEa3XspaQu1hMwx54qlpP+nD28J6RjOzfd9QOcHsgQmNlp4b7MHyt+oY
         44zyOk7Qr/GT4yErXLEukcX5TZM9dINbFaohXfheyNyzHkXE7JHpbRqmIXglciXELDe4
         eoOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mmnqtftN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d194si2193739qke.330.2019.08.23.10.32.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 10:32:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mmnqtftN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1DQW-0008Kg-81
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 13:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58792)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i1DP3-0006be-53
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:31:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i1DP2-0005Z3-4U
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:31:09 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:42126)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i1DP1-0005Yt-UZ
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:31:08 -0400
Received: by mail-pg1-x544.google.com with SMTP id p3so6115023pgb.9
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 10:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V/AjrV59P1NHShm5e2W+azDxhSKVmZ9Ld6wDgXeXJxw=;
 b=mmnqtftNsRXhz/7YLIWfBWUdoFg9pElLL+GUNSlQhuzTPmi+/paDbyZCmvJdrKa1dL
 n79DRd/KDeqM+tv9UyLyHMObqOOMpRnwUBvkSUJLvr9D7MCSxNL0NGfmR/Qu+v8KhFq9
 QE3oF9NkJfgXFH7Ppkjxn4RDKcTs00KwCKTqO2RJZD4/dbG2WsKpwoBzepzD8LmGbKtK
 MjrPv4a+tQdkbwIyXJeXL2VaAhcVyTaVWBo/52GniMuXGEgkSLZDdd3n4C4za4UL8asZ
 GbkJcH6cnCy76AjIdiGQJr+hsUDAL+qxzqgB/yWrV4Ms+QqILkNTqrrBPq8guAxCA/6+
 O87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V/AjrV59P1NHShm5e2W+azDxhSKVmZ9Ld6wDgXeXJxw=;
 b=NWyGZSVRfD0WoJapTKnYm3EI+IpUhYEA6r4pyPjgHvweN8Y2hRUE4Xh/fgWVtHd0Pj
 EKCRgQcSbvQPZBKRlCZIf8j6+iWgTLp2DkYA267hOgBxGVhTJc4w6qDq4r/uKbaZbJx/
 2Xn6O+DKIh3RuEsrce9fjbL2xnT4D+g+NLbB9hTz2kMrXexmwLDYVPmBk3hXq8MSqDhN
 ySn3x+0vvNSCc+JjFI0NbNsnugO1/62DvQpRCCAMGrgwnrXAOr3Kg8mJWBkqJHb3tnDc
 I3DncUToTz2Vz3EBXdhnnttdsK/+tIGuWmXC4+glfOzIoOk5Syfokj9vFuASdYUy2Aed
 9lHw==
X-Gm-Message-State: APjAAAW751lPl2uYewpHuaN+2r59dC5qGGSp3xes9DZROD6FcSK00LEr
 OqQBbuXjpdBWOPJGzpqTgn33nhj9MOU=
X-Received: by 2002:aa7:8a99:: with SMTP id a25mr6547578pfc.127.1566581466972; 
 Fri, 23 Aug 2019 10:31:06 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id i137sm4217522pgc.4.2019.08.23.10.31.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 10:31:06 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190823143249.8096-1-philmd@redhat.com>
 <20190823143249.8096-7-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <08147950-75bc-9145-bb32-d1b4c7f84648@linaro.org>
Date: Fri, 23 Aug 2019 10:31:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823143249.8096-7-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 6/6] hw/net/xilinx_axi: Use
 object_initialize_child for correct ref. counting
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3EVzsfzA8HX6

On 8/23/19 7:32 AM, Philippe Mathieu-Daudé wrote:
> As explained in commit aff39be0ed97:
> 
>   Both functions, object_initialize() and object_property_add_child()
>   increase the reference counter of the new object, so one of the
>   references has to be dropped afterwards to get the reference
>   counting right. Otherwise the child object will not be properly
>   cleaned up when the parent gets destroyed.
>   Thus let's use now object_initialize_child() instead to get the
>   reference counting here right.
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/net/xilinx_axienet.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

