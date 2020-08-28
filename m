Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1409950lfc;
        Fri, 28 Aug 2020 05:21:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBXMMZ+ViHpPM7ufudwpCU/jyXS7Vx98oiBTH63Nk7TQqgTp+a6+infAGi/lAMlF+aPEuH
X-Received: by 2002:a5b:b05:: with SMTP id z5mr1983754ybp.321.1598617293452;
        Fri, 28 Aug 2020 05:21:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598617293; cv=none;
        d=google.com; s=arc-20160816;
        b=s8iWJO56GGLNIOyOz9eViZFohNtHiAB/7T+0MVcJC6VtYOWQWjpJJHDvHSxHyW4HaN
         hcIW7uwEnbakKLqX0SBwMAEYaeo9SR/myS59dyh1avUfTSywOpPPMrt/wLWbCDjogquq
         egIl2GjscD/FbvjAi6tmrI8XG4IXemL0jlHOpHihcaeYY13c0rl0nziVYGP66es7sPyS
         YPV/iBGrTzMmwfJqFXteCVi7Tm/zVszQV16RU3s6wsMlDN4qubPyTjnAdEj4KAbfV+H8
         7FIQasHW8tTdZdTMYIWv0LDrc6SXHQOQDrkY/4u4CecW0l4VPdTwXMeItz8HbsrMu0pO
         RSiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=HY2nAYSnjnPijvGELfAuvz60krWapW0OG8bbFERkYDM=;
        b=eoYyhFpBc2riIpNdwBTu1CoLZbknaJl9RVZaObtXI+qkXxyDMoKPQZfmigQ8G3ZGfT
         sCb7PWMyA9oGRUkFRVeG4m7Uq1BzSJxOdztG5IoVbVlhRzZPQ6UYIABeesffDeK0Nx3O
         Wmb2b6jht2GSK/SyHmXPfEEvqe36chJO9ESPgPaR2OEC7Laas+wXYVdePNtRZN80uCFJ
         9EXrGdCsItV6FlXEs+2GQU8FPsPragGdHClRCtAv7yixTGSWMEQDuhhBCy/R7lBZMpWc
         K5jpAwEOaHBNVTeWcDWP5+CrK1m0vSTdSP7iWQWmcoUsC7Tpga1Af3WIbQTNTNGs+Tnc
         fhzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=IgL70+wS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6si738625ybn.356.2020.08.28.05.21.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 05:21:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=IgL70+wS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBdNs-000654-Re
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 08:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kBdNm-00064o-1E
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 08:21:26 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kBdNk-0000t6-CP
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 08:21:25 -0400
Received: by mail-wr1-x441.google.com with SMTP id b18so1117872wrs.7
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 05:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HY2nAYSnjnPijvGELfAuvz60krWapW0OG8bbFERkYDM=;
 b=IgL70+wSWfd+FjC42IV6fT75SwVaftU9TtybrOfiMn0pNyvE8JAOIe8P/qm8SKu3WF
 su0bhS4/1ZSNcCksoRhnm9ib2EI6qqsDTf8NCv4eQqdLKFGT0zdXDDa9hxgmYaE6XXuX
 mj0AE0qAZhgTmS+ZNJJirV61MbXAdLjys1QWDfEFrhktU7+jD5/BvN/JDD6IPdtul6Lo
 t25g44f1gdOAdpszUiu76dPeIJLynp+I6GMub1hCbWfkk9ge+5rt9UXqfTvUl2sxTWmi
 jRC+uMDazpkZNiZJE5UBcuSEUArVn+eVcZtBqpci+8AMLEGSzkPCvWKAvKciRnJyOBf4
 OXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HY2nAYSnjnPijvGELfAuvz60krWapW0OG8bbFERkYDM=;
 b=kXzrC6B3Y1Jy+r9MLL2MoUmuGuFmPKnRnKXafk18OhZqFaWxBT4UnMpOnIPh4MF6zu
 4OzA7zGOJfkxXX4lva+vUU6O69H/k/llHbd95JZRX/vWRD3+x3aaeif7lMWmPiFbcm0E
 1YIwE1RcSE/gDlH3oGbjuv9gq6ZZ3Ww0YIXSfli4SGkmWGmlOfDlKAyOlgkm4/R6t8jf
 ZGXQJFb+veuTNQcOhrQzAp5Qa7U6Sc760lbiygguB6JM8/sDnDx+xQc+lprKKKzsGTC7
 kKcKxx90/ylZwkQ7JB1+PNYnZjtzwWSyATFccxdGJNRa0N0Jgapx1Fg4Nt8GpbvbLrgl
 dxfA==
X-Gm-Message-State: AOAM531ntnTR1BA5WRwB/g9+FYkhJAEki+T9LZdbGWh7won0UD4Z82JG
 bq0AczLFJMydV7xtRrXPZSBy8Q==
X-Received: by 2002:a5d:5304:: with SMTP id e4mr1368838wrv.280.1598617282753; 
 Fri, 28 Aug 2020 05:21:22 -0700 (PDT)
Received: from vanye ([2001:470:1f09:12f0:b26e:bfff:fea9:f1b8])
 by smtp.gmail.com with ESMTPSA id 128sm1916186wmz.43.2020.08.28.05.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 05:21:22 -0700 (PDT)
Date: Fri, 28 Aug 2020 13:21:20 +0100
From: Leif Lindholm <leif@nuviainc.com>
To: Graeme Gregory <graeme@nuviainc.com>
Subject: Re: [PATCH v2 0/2] Add an embedded controller to sbsa-ref machine
Message-ID: <20200828122120.GZ1191@vanye>
References: <20200826141952.136164-1-graeme@nuviainc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826141952.136164-1-graeme@nuviainc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, rad@semihalf.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OinABAECW7xc

On Wed, Aug 26, 2020 at 15:19:50 +0100, Graeme Gregory wrote:
> This series is to an add embedded controller to the sbsa-ref machine
> so that PSCI can communicate platform power states to the platform
> which in this case is QEMU.
> 
> v1->v2
>  - broke out the EC itself as hw/misc/sbsa_ec.c as seperate patch
>  - applied review comments to date

For the series:
Reviewed-by: Leif Lindholm <leif@nuviainc.com>
Tested-by: Leif Lindholm <leif@nuviainc.com>

Thanks!
