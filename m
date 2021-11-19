Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2372869lfk;
        Fri, 19 Nov 2021 06:39:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwX4Eh0xrLtJu1QapnX2uKNb5u0UrTOZ/NBEwe3V2302fXocYNcnAskdzYAxcEt8vDcszLC
X-Received: by 2002:a67:e1c3:: with SMTP id p3mr94528187vsl.9.1637332762991;
        Fri, 19 Nov 2021 06:39:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637332762; cv=none;
        d=google.com; s=arc-20160816;
        b=Sc0r37yPjhzGZV8HPAoje2cp87QaPBnjmkNxOUOITA+ffTVvzqbO2bEvbloGQTd1em
         KG5Gb/7LyhpUy6FCs5l/O4SfORH13Sl4I5edoN7hwXouO2j2Eo52KKVZ4PVzV4/oLiKC
         tjPAZi2C6thsHsPjTBrrTC8rxOMd9g7uXWU67lQbYUTpCYc/IhsDGeWhE0XX13f4Oct9
         Nob4kGuvFT9X3ESAcUbiv4alxx/QUxRMGC+3Bu38PV7axgEqWraWuTDVO6KBXa6gtS/2
         kajpT78kDXfEmLyWpadQzZCdrGNq/eZw+5hV6RhFv43mGw8WJ/oVyyNwrLR+ki4lvJxV
         hj2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2bmVDbePJfavv+QZsSaVELXMjB4F1GCrTXg+hUY95xg=;
        b=IE+CJ0wr1etkhucsIc5TwprucalIejXECjqFkee4fttQMg2bBrRk3QtULYvZ5aQAQO
         XbHP0/cwM9uL4ggtHPVOi9y7xbuvHJC1WyFkbbqSNBC1cT/VBtF6MMgNfUUXLXhPINmM
         bqxR2LxGZT6vU+CFiDq09zAaEP8gYgdEskMyMreyY6N6RDlXuIXkj+S76sYg0Qzm0esd
         MPZwxjMQF1Bsv7zgRK6349KBW0anYL5DzKQhZUIbZLnALex1+1vHFQKMHChGvBv80Fmo
         BL3X1qqg2PKH8JVDNlcNu1H2wFPZn+EB6qybR6BtcugwElT29uCwFwe2gooN9qBXX2vp
         nNZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=gOoFfF5p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10si155591uak.56.2021.11.19.06.39.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Nov 2021 06:39:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=gOoFfF5p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mo52w-0000TN-Cu
	for alex.bennee@linaro.org; Fri, 19 Nov 2021 09:39:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <janne.karhunen@gmail.com>)
 id 1mo52o-0000T2-Fj
 for qemu-arm@nongnu.org; Fri, 19 Nov 2021 09:39:14 -0500
Received: from [2a00:1450:4864:20::12d] (port=36751
 helo=mail-lf1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <janne.karhunen@gmail.com>)
 id 1mo52m-0006hG-NX
 for qemu-arm@nongnu.org; Fri, 19 Nov 2021 09:39:14 -0500
Received: by mail-lf1-x12d.google.com with SMTP id k37so44548758lfv.3
 for <qemu-arm@nongnu.org>; Fri, 19 Nov 2021 06:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2bmVDbePJfavv+QZsSaVELXMjB4F1GCrTXg+hUY95xg=;
 b=gOoFfF5p4cvhu8YjRLXzuR3dKrbneWPSwAifXGfByl4vJV9JpNBG7ISd8nMV5J2oLM
 M45zzFz00xWbOowMbL3dtqxqKZ980K1Hre2Vyc/MWlM8ejmDTL8/aXk2/L1GSh/091kg
 yQ2MOcxRkwK4lr3UskCFofVFJ4flljHv7PO659sAPbU5/+tGwQgQcA+7jmoTCFOzNbjO
 idxS/JhPDnirnp69YGmObmlBgWXHZq8gsf8sBDgDVGK/PfD+KUI5S91qOS4tUsnz/K+9
 UlbgoqbDDlcA/sUsetcsVksqiP2jvRQYHih90rwzboXUOx6SHA1WIr5eGwIP1Z83caqs
 0ZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2bmVDbePJfavv+QZsSaVELXMjB4F1GCrTXg+hUY95xg=;
 b=3ifq1tdZo2Pl5KNmuOpS3zRpPYhE5ux7V8VQ7KhGT1FeMoPKIgAL4vDl0LJGAl9G8V
 HAsBgsnR5SDuiAe8n0d1Ew6dk0wTlkuCdVNKTRM3S+h1NTlrGSzx3W4hMt4y+fjEFj+q
 wvL5LZGylA+4mmMv9+EdF3ljopvkcQnIotbeuSQvcAov2K9AXhnzn9sHUoJlwN2Wu+9w
 TvG8vK4yQcCu/kLy5dW9rzdMWnG1RxqRi+yt2pbYKKMad8i/Pbp6nU+2483tFiGgxMZI
 +ulXVATSeqH6bE/r7VX8xW3krr6/Yh+Y2fYg2sDi18lFBUHJSlNSOwLMzfsM+/6U+QTv
 hwEw==
X-Gm-Message-State: AOAM531VGX8Snv1QkyJF5gk9lLo3dGR8d/NdOPg838WYWF4Bik80GeJj
 vhaEtVQWO+aHlzJWf/D/rWsnx+zj9XUuRj0qu9U=
X-Received: by 2002:a2e:9e4c:: with SMTP id g12mr26719571ljk.114.1637332748336; 
 Fri, 19 Nov 2021 06:39:08 -0800 (PST)
MIME-Version: 1.0
References: <CAE=NcrYJfjF-pEiX-tY7NfiTbDfXtcxnk5AnBVwc2AX4cpeCrg@mail.gmail.com>
 <CAFEAcA-CKqZPF8A+WsXE7gLgOPPYncteomvMSOcAuLEkB9F-Ew@mail.gmail.com>
 <CAE=NcrbPW4LVihnZksOCJ6NcQQYkwJudbqrp-sUEx663+qyG5w@mail.gmail.com>
 <CAE=NcrYPqu9oa0UZM7VRDtUqQWg93spVOdRLQGs0hdHtqghGVg@mail.gmail.com>
 <CAFEAcA_uzvNuMx9KJa=Z_Dwuonf10ekTDUbNf9bZSVa+hNtHLg@mail.gmail.com>
 <CAE=NcrY8GJZ-Py0n_24JDao0sJLcYoZ1TSK4RMLfkiWyOxPR3A@mail.gmail.com>
 <CAE=NcrZ3jU2K4a7tqhKxOSGpbEf=9-z6P1vhc=ep6JWXB0zxsA@mail.gmail.com>
 <CAFEAcA-pqkZ8DEC3d0yCeNvoeDtQvdf_s3+SpyeDdOkabCOXVA@mail.gmail.com>
In-Reply-To: <CAFEAcA-pqkZ8DEC3d0yCeNvoeDtQvdf_s3+SpyeDdOkabCOXVA@mail.gmail.com>
From: Janne Karhunen <janne.karhunen@gmail.com>
Date: Fri, 19 Nov 2021 16:38:57 +0200
Message-ID: <CAE=NcraAxKOGGmOKDmugJdt-bzwpUU3dsWo1ZLuhNo6dr95JAA@mail.gmail.com>
Subject: Re: softmmu 'at' instruction support
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=janne.karhunen@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jh3JzCTqA/H4

On Fri, Nov 19, 2021 at 4:28 PM Peter Maydell <peter.maydell@linaro.org> wrote:

> Note also that not all ELs have two TTBRs; some have only TTBR0,
> in which case you get figure D5-2, with just the starting-from-0
> part of the address space being valid.
>
> Big question: I thought we were talking about doing lookups
> on virtual address 0 here? That should be using TTBR0, so why
> do you expect it to be using TTBR1?

I suppose I wasn't entirely clear on the kernel/user mapping split, I
just did the second stage and didn't really care about what exactly
happens in the guest. Things seemed to be a bit more complicated than
I thought as bits above 48/52 were not ignored after all and made all
the difference on the table selection. I had the impression it was
just the calling context that defined the table to be used.


--
Janne
