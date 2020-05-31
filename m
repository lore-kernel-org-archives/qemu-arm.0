Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2467607lfc;
        Sun, 31 May 2020 12:49:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/5cyf29UpxGziagNWN0/PNUg5UERYc9FY0+bq/GRoOqcgxt3gGYBUYmNi/5d0OiCJ4Bi3
X-Received: by 2002:a25:c1c5:: with SMTP id r188mr28149732ybf.240.1590954549014;
        Sun, 31 May 2020 12:49:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590954549; cv=none;
        d=google.com; s=arc-20160816;
        b=Rbm+gzOFNJ5pFwEEJ5dEfl3zR2ipv6GhhjiSr9nuPjDs69TaWs7Y3lYO1XRc7V8Riu
         fekpN3SS1CtADmOxU1VwsejRPUOqZ3HBB1Bov81ikGeaJqIICE7DV7SLPJ81h7jsqiWt
         jHBQw6MSPWoh99we6BY4JrGoue9HM1SnjxGeZRT/VpKRZhELBuyvsGh4DJk4hLm9YZ6s
         lBCL91rqH/CryfeXputuo13yv4NTPpwiHafqczpk5GVjIraP/UbGLqWNoxnDwrbAX0MS
         sGgLooWKTPJbew4OssaqyRwOpMYVW3khWQ0i1VnH/QdmEaq4nJKoWdqMrL4L4oPmgCkE
         GwWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ILaa0c1UMVCHaphm0DdLpskuHaCCEchvE3UnkzWKwTU=;
        b=TNrYiQla4qlt+reWr4B63DiyK2QDmgUGnP/phJy/rDuS3d/3Nt49DJp5TVs3HFnOE3
         /LsXOuv8lMrJvf4vRpMB340fdfc2BME4m1ASxIE0f76T/vHyRdKHE7fW18/D4MQPMOwS
         /UQRznS2mKlBipJUfp2FAo97q5KVFknO2PaF9KdawzeCPY7QaCmxLWCEH1rEuAQy/r8O
         gIgIurF6V2q//2BpwKmWlqQicV/jLmFA2qp/YX7Gw31xlLHiYVGgTtDSfT0r2otWkxWO
         Rt5FNnOLhCTJPhDKUT5RMwknvTvFmseZLfHWGX8n+ZangXgGcVJvPFs4Y5GYHN8TRP1f
         Ykgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="gh/yOzBv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 194si4121505ybn.356.2020.05.31.12.49.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 May 2020 12:49:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="gh/yOzBv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfTxE-0003IN-EU
	for alex.bennee@linaro.org; Sun, 31 May 2020 15:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jfTwx-0002xT-0X
 for qemu-arm@nongnu.org; Sun, 31 May 2020 15:48:51 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jfTwv-0006hK-LK
 for qemu-arm@nongnu.org; Sun, 31 May 2020 15:48:50 -0400
Received: by mail-oi1-x242.google.com with SMTP id v128so7252081oia.7
 for <qemu-arm@nongnu.org>; Sun, 31 May 2020 12:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ILaa0c1UMVCHaphm0DdLpskuHaCCEchvE3UnkzWKwTU=;
 b=gh/yOzBvDIyuIfovF4HlMlYod16q8wUChDeH3hG7Vg+iTSHsq68cyaZOlaiNPIf9US
 ygkjSaJT2vmqdUJQIEGlL8gV2MtXWHco1mZIOuO5KiIKQs3G5nr+4EVe214ZZXeEv7t2
 BrAvP75A4QrCdtXWHeTAoOJNw5pvGzbuC2G/kLi877DgbTs+y3Xd2yQqelINQ+/4seCD
 JnV4TjmGBJgF8NzHohYqz7Kn6m0rIYAsc00stNMZ+W0zNNKTer3Nbo9C6s5802r+PVaz
 RvSVWI8S5dnalEPSFqzdJ82hUjtjWbzfyTWqx+oNh8fIgRphvyytYus3c9E04tDW/7Xd
 ywBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ILaa0c1UMVCHaphm0DdLpskuHaCCEchvE3UnkzWKwTU=;
 b=UPibxi9R3s5qDIwTrPZwicnqijjUaMYTdJ4kPvHDaTxVat4WydI2IXuWJwruuHvdXR
 AVQZUL6jKeKHTRLOwFZCJFsr4XvzD9IF9d/yRWfTBTaXvERSly/skTiJnkfuN1xSKyFk
 jD3UJde5KmRDWX6HFhOWFnJAVUDAnVYIcbjd01qa7b5mWkMRMcGtl0X9JZJthaiN5Pr8
 wgsAY5QlTPF4ZZPsKIqMIx89d/ybDb7puTAbsHCt3QZRrtus3g7tdBtGv5Fsnz/gqKCR
 OKFnJIyKpHAeJSN1XAPGeLwpJ0htwjfuHflxc5C4D2c2hiMSBQTYCLyDhMEM1eB7S+/4
 t+BA==
X-Gm-Message-State: AOAM533wdH2tkrmmrx+dY7BkhM4+F6OZsPpbbvclLxCV59Q5q6Msec48
 KReDXqgIpHt8YQRzJQj4jyYVCiDLJIXk1FtEHFbT/A==
X-Received: by 2002:aca:5451:: with SMTP id i78mr7136005oib.48.1590954528355; 
 Sun, 31 May 2020 12:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200531173814.8734-1-f4bug@amsat.org>
In-Reply-To: <20200531173814.8734-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 31 May 2020 20:48:37 +0100
Message-ID: <CAFEAcA95OLKmG1xNVjAg_KPt3hfN4vT5wvZ6SJbcKk5zdYO_Gg@mail.gmail.com>
Subject: Re: [PATCH 0/8] hw: Fix some incomplete memory region size
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, QEMU Trivial <qemu-trivial@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f8cnJj+QrlRG

On Sun, 31 May 2020 at 18:38, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> memory_region_set_size() handle the 16 Exabytes limit by
> special-casing the UINT64_MAX value.
> This is not a problem for the 32-bit maximum, 4 GiB, but
> in some places we incorrectly use UINT32_MAX instead of
> 4 GiB, and end up missing 1 byte in the memory region.
>
> This series fixes the cases I encountered.
> Also included few patches while reviewing, I replaced some
> magic values by the IEC binary prefix equivalent.
>
> Regards,
>
> Phil.
>
> Philippe Mathieu-Daud=C3=A9 (8):
>   hw/arm/aspeed: Correct DRAM container region size
>   hw/pci-host/prep: Correct RAVEN bus bridge memory region size
>   hw/pci/pci_bridge: Correct pci_bridge_io memory region size
>   hw/pci/pci_bridge: Use the IEC binary prefix definitions
>   hw/pci-host: Use the IEC binary prefix definitions
>   hw/hppa/dino: Use the IEC binary prefix definitions
>   hw/i386/xen/xen-hvm: Use the IEC binary prefix definitions
>   target/i386/cpu: Use the IEC binary prefix definitions

whole series:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
