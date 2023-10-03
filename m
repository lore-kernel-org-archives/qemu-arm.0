Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2123684ejb;
        Tue, 3 Oct 2023 10:12:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq2RLsWIU0UN21A5r9PT7JknQeuzqyVt6D3jUvLZr8UA5TRfazH+xqJkHHSh7lCxchV9p9
X-Received: by 2002:a05:6214:4589:b0:658:6d82:54c6 with SMTP id op9-20020a056214458900b006586d8254c6mr16940749qvb.12.1696353130141;
        Tue, 03 Oct 2023 10:12:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696353130; cv=none;
        d=google.com; s=arc-20160816;
        b=xBIykAfSqjbGwWCVTtWVDVuXLlq5RhknlgcdgCNmiH80vriT1WPzkv2VXATS9xeTfd
         66Lu8i+USs6swRiunF4M2+9vOH5Mg9DxWpfJTm6BYlkudgr20iC16YE0cFmaXqUfqlwe
         dGWPkcH5015O4MhPzpF2iDsgmUq5+zhOeQimO4zoY39ytL5Vp4DoF865JS8NobnlthBl
         SSm0WkpuyuUCNvSlSsjQbitipHam4aaubIPpml75gmSBpRU2vPUg6zP4+C/gbfm51LPG
         T3QI6TWTaOUemHoz00ABdKv+9tBylnLgnR2+iPPMjBg30NyH1RcZuveXcNvOdnbGVi6z
         N3/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=d1KqZBhkH19Q7BAii7vbPA4pXnqS2F48cwuYcpbZ0A4=;
        fh=D7j+9KJK5gaKY5dGwynriN2GHHnhcQ9wV5cMstBQ9zw=;
        b=YMYzPR3t0Vc5pL3E8/9k5WgRCmsrKBTFi6eIpS/pjWf9vWTID5cnS9UqcfedeLNAbv
         aij+AyZE5/kfe1EPPwfQXrPg1M0K6xzTuaeeRhDkDGx6JihVzwrheDrxSYhhOBtwHsy0
         Y36Jqz1SU/ohW10VLg15WUUUrIKO/2ggY6IkJUYGOW6riHtxWuZADKXUZGEH8tbYJ8u7
         mKFitvY/1SfV0DLnwKNdUNWpJtAsaZGOrBnqeaqctZBNbqtCfwqlevOR34AfvZpyDYqu
         XaaouTywzZSiQ8+wwAeKp4UOkAAArwNr2WsnDMkLbI/8tV2I4d1WXTTXO9LIX9wSMAPe
         ctXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5-20020a05622a174500b00417f87ff854si717279qtk.46.2023.10.03.10.12.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Oct 2023 10:12:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qniw4-0007mU-Dm; Tue, 03 Oct 2023 13:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qnivy-0007iK-Ry; Tue, 03 Oct 2023 13:11:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qnivv-0003C6-O9; Tue, 03 Oct 2023 13:11:46 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id D3F2227289;
 Tue,  3 Oct 2023 20:12:24 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 997062C948;
 Tue,  3 Oct 2023 20:11:39 +0300 (MSK)
Message-ID: <a6cc110d-132e-b3f3-0b64-368bcb5c31a9@tls.msk.ru>
Date: Tue, 3 Oct 2023 20:11:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: FreeBSD 13.2 installer does not see AHCI devices on
 aarch64/sbsa-ref and x86-64/q35
Content-Language: en-US
To: Niklas Cassel <nks@flawful.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, Damien Le Moal <dlemoal@kernel.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Ard Biesheuvel <ardb+tianocore@kernel.org>
References: <b7e00b36-2ac8-44fa-9847-b2025ebe05f6@linaro.org>
 <F1D854EB-9C6F-4A54-BAA9-D75C40DBE86F@flawful.org>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <F1D854EB-9C6F-4A54-BAA9-D75C40DBE86F@flawful.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -79
X-Spam_score: -8.0
X-Spam_bar: --------
X-Spam_report: (-8.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.09,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: B79CtdHA1A4O

26.09.2023 15:05, Niklas Cassel:
> Hello Marcin,
> 
> I will have a look at this.

Hi Marcin, Hi Niklas!

Niklas, I remember asking you if the whole thing is okay for the -stable,
and you was a bit unsure about it :)  Regardless, I picked the changes
up for -stable. I don't think it was anyone's fault though, - after all,
I guess, without the change being in -stable, we'd know about this issue
in some distant future instead of now :)

I'm planning to release 8.1.2 soon, with freeze being at Oct-14.  It'd
be really great if we can include a fix for this both in master and in
8.1.2 (8.1.2 should have a long-awaited fix for a quite serious long-
standing issue in 8.1).

Were you able to take a look at what's going on here?  I wish I were
able to help here but I know right to nothing about ahci emulation..

Thanks,

/mjt
