Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1404739lfp;
        Fri, 1 Oct 2021 08:48:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYU1H5dA4S0rlSlmf+vOOeyQJ1/7l2xNa+gx+q2VvUeQ62ryG6rhUm2h9zE3t/vDSW4sEp
X-Received: by 2002:ab0:5e9a:: with SMTP id y26mr3324662uag.87.1633103312120;
        Fri, 01 Oct 2021 08:48:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633103312; cv=none;
        d=google.com; s=arc-20160816;
        b=N0301UGz4Ib4PeoQ8wHm5D0wREZYf6+//Jv0lmqzMTbc9nAvZLKP5wtCmWk9S4IJ0A
         wIwrkMypbUzcuvGNJEqLTqS7SIDTmsi5GCde1BmTwo78xiPOmBr3a4OWFMQtFOWExfgF
         0/4GXYqm0UZzSysO/EVbbn9iYVf2dibYvyy+bB5PlBdqyPeF4gxowDdBqBO9z/ebgR/0
         LTCTlYQhl22t9Y683tLOehfRym0izGqt5PrYpKnmM6ZPO+HxOub+8XdFC/bv2KI9reMb
         j/GYpg1rKqyvPNl6ZOqcFB+UMc7X+lpRAVNVJ5OachO8c2pw0FwKwDdduCWc90ll4fBT
         whiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=7Q9VMFEWTujq0NqJ3cfiw4FFLLKL4z+4HP6hk7UYmNw=;
        b=scDq77S2/7yzFXy/i3zGdGhQAcYCXsI5QMgktrgXtn8/YFx5Zxd2XsfMTAZfkBOOQ9
         AYJ2TUAwzdirVgtlpEIro/NutleaPvnf3ANXGlid4Ew4aTTgR3wFsgQPlcPoiN1g4meP
         oPE7jqqbi7pfgkp+k+pbtsjo+cSSv9GsAUCjqLgfWgnNgLiLYJPEKLaWqPd1NOECYZPx
         hBUQ+YbUX/gTtcF1UtSWOL5U0ewMJpM+bvXCM40LyuFsCak8DIj7pNXkeZBAIUtHOwOP
         Z1/L6y/4MyT2URbZKojrUbyGwTw+MGT0DApUV4WE8ce2njfX1+Uv/0rLW2S/ZP/656kr
         7oMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YFSY0jg7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11si2790981vse.10.2021.10.01.08.48.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 08:48:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YFSY0jg7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mWKlz-0002no-Eh
	for alex.bennee@linaro.org; Fri, 01 Oct 2021 11:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWKbc-0005rX-5u
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:37:48 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWKba-0002Qp-Mf
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:37:47 -0400
Received: by mail-wr1-x434.google.com with SMTP id v25so5515830wra.2
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 08:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7Q9VMFEWTujq0NqJ3cfiw4FFLLKL4z+4HP6hk7UYmNw=;
 b=YFSY0jg7wo2M23F56Vvbqd2KSac8QYLP+sDEKIlPByAgfmcF7UaUuc98OsqvVFw+ad
 fFs44fYOBnpNdNNYB+Iu4Qd2ZNmWlj38JUWI91jR0rbeZfkEUFqMvzI4lleKW7kK5DEd
 HlNM/Bj0CnXTnNivxVRP962xXNvXOhAXtzuGunTzp7tbmx0zQyDAD5qcmgiimbUvdA1x
 KRYHFgwZuNkXqfyaEN+m/+LJi/e6wKu2h0sDTuBr8opViLgE2E3k/PgM1ZX6kYm8T8ov
 BYjBuxTtdghgKcl3HfcnTyeoyeFgJrKpGni1CK7uyladRuEv/I66x1fIIHljniPt2gRF
 fzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7Q9VMFEWTujq0NqJ3cfiw4FFLLKL4z+4HP6hk7UYmNw=;
 b=eXE80eUhC/AUJzNnbv85FPciG4QDY4hgx61sT2uCrvGUr+HYBhzpmP9cV+xVDmCqcb
 LeAc6Aw8tikVG3IOFhaLwTafF0IgiPf4C5el/JUF2tvWg2rprnB+m9L4Q0yPggHhpS8L
 esV7ppxR37DknPR2lh14dkQaV22HrlwdeX9TYGTlDrr3YZu0yFY+tSf0hj2sWYw0HOCs
 OmAR7k5N+eDyehfcj+s++ZitZWTJmQJ4OilT0B4jo901TML/UIAgvjTPMgiD0grnXHBm
 0Y56P2+VgMiyFwzOq49/uZ9J8rkeqBTmecnOUUS4XGKUv+057+9+sa+hmQiCRfgSKc5/
 JfZA==
X-Gm-Message-State: AOAM530iDuiWGBM4TGzm+rSLWhCEXwsciADSXYRw6BPS2SQRihk3vc1r
 GY1ANguTulTc1Whe0TM2yq3MQw==
X-Received: by 2002:a5d:6288:: with SMTP id k8mr13604998wru.137.1633102665498; 
 Fri, 01 Oct 2021 08:37:45 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id f15sm5820100wrd.44.2021.10.01.08.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 08:37:45 -0700 (PDT)
Date: Fri, 1 Oct 2021 16:37:23 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 07/10] tests/acpi: add test cases for VIOT
Message-ID: <YVcrMx0aHHbeRqeO@myrica>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
 <20210914142004.2433568-8-jean-philippe@linaro.org>
 <20210920103936.2cc94969@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210920103936.2cc94969@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6812tEbqMpcK

On Mon, Sep 20, 2021 at 10:39:36AM +0200, Igor Mammedov wrote:
> > +static void test_acpi_q35_viot(void)
> > +{
> > +    test_data data = {
> > +        .machine = MACHINE_Q35,
> > +        .variant = ".viot",
> 
> > +        .blkdev = "virtio-blk,bus=pcie.0",
> why is this necessary?

It isn't actually, I think an earlier version of the patch needed it.
I'll remove this.

Thanks,
Jean

