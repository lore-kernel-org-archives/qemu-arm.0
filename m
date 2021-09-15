Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1403776lfp;
        Wed, 15 Sep 2021 00:05:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9HAqsoMY9SRQDZb/YWF158bV+ydxOJUNWAa9B4vCDd4sdAhw3N8PPXjK1A3MmnTWLKzyW
X-Received: by 2002:a05:6638:399:: with SMTP id y25mr18046376jap.23.1631689507640;
        Wed, 15 Sep 2021 00:05:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631689507; cv=none;
        d=google.com; s=arc-20160816;
        b=czFhh5LdyaS9J5KoMgw2zosTSH8WxbKiFeR6PNHo3gMxvAd6jTjO6eGOOX57IJgBLV
         G0Ydkty38OEowGME4Z40Y5czeh8ZbM99nIikp3LqCm43mIslfMmqALb96TBpcoULUURy
         uLpaYJ6UK+iiJzmYv1YZNxwPe2/noY+ZMwdb2PBzIhSZXScOw4qPg+Wf1g0M6p4CaWw6
         HJsFLI0/EbHqDri6RG4WFp6vYqC1RAAzATz40+qXIlxfvEfQQxzzdjxUCjyc2aAfLaQD
         sAUur/lJnEi+sUeMAY35+d7n1/XCfqDKe8iknlg1QNZKE8koHS1DdqG92q/mKsGRGpCP
         wJxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XQsK2tVvUIfERCk7xsCI4Ejtq4oM6ZnZ6pFRx/4L4iw=;
        b=MRlrIdsWNWWUIZOSyTHDbHx96bx/1Z13UXIpu2AijXVubgiTYifW17CTc2BqV/u/9s
         xLPb9Jh2i2QNqmopDHrCNygbPuQgCe4U3qaSATxcKdcNjFjA8Zma9RNXSNwPc1UUd7Xf
         9MxHLXAXu/uHnO+MDlCcTDcIqMXfiT73fBqn1TH6azdZ+TXOuI8NOIWoSVO5nwUW1xYU
         fHELtih8R2i1DnQA1gXDHDV8NhbFnQpS66jDLzwJJ+RzTf+Gz1DEuD2ZdcQS0JRxfyI4
         yeuKh1BFvj07yy5bL++QtAVPQSX3KIkrZIVNB+Zr1rcbV1NQneng43NROvsA6Mxkit5K
         +zVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Z6hxxKBQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18si11374399iox.32.2021.09.15.00.05.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Sep 2021 00:05:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Z6hxxKBQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQOyg-0005E2-CH
	for alex.bennee@linaro.org; Wed, 15 Sep 2021 03:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQOxx-0004ay-FT; Wed, 15 Sep 2021 03:04:21 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQOxt-0003lC-Ou; Wed, 15 Sep 2021 03:04:21 -0400
Received: by mail-wr1-x435.google.com with SMTP id q26so2140170wrc.7;
 Wed, 15 Sep 2021 00:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XQsK2tVvUIfERCk7xsCI4Ejtq4oM6ZnZ6pFRx/4L4iw=;
 b=Z6hxxKBQ73xZWGdj1a876+xRkPLxPmzjy0Q4aBJ3UyjIUVupD87cCa3xoXNfm+aEIf
 kbZAs2jQV1ocYVlNN7IZsQHZ50x+juMtL/Qz4Vy/wz7VD3Exc5eOWcYdggXM7VSS6Jx4
 DY3Jw5jnGJ/23Rpq7BWCRj/wl+RqilDldBWFXy+5/o37GHl6CG3T4qEeinMz0P53iESP
 mWrt0wzs0PeYKGWjsVDkSELIlXd/xGswToR28P2l5uJizOf31JCFGSOk8JfWaQfHnYx9
 O6ScS76334uNBno+0MLsEC5VOTHhWPABNBjlsYluFgjn80NOCV34vgbTnsl1+wXICj53
 jctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XQsK2tVvUIfERCk7xsCI4Ejtq4oM6ZnZ6pFRx/4L4iw=;
 b=o57wdx1I1fv/KbNMuBWiKzJMYfGC7jzBxZK8G25/x0EFqOBLvDOV7v70lqmaN23Cu/
 P/fOiN7FNGnVdZf6/fRcSsUAS1+2Op24hmir9QdxujWO/3NN7odc7Y6Y+U9/bN1UWpk7
 Myt2VxtLLFAa5FaBIYbt45M0dDAJTItYtP3j22giZK+m0uSGc27u2h5MulHZAKH4YK5u
 f19+38ok50L522MmsKeV3OJOmFzY7pES9R+OaqFYJ0c+7nBFlV/VWKZtLPxfjrflapot
 CbRRwT2+6jqJX9/e9WP4X73AWURGuBwu0JGpeX4NQtrnWN721c+z2mFwrUL88gYT4oYk
 hfEA==
X-Gm-Message-State: AOAM532MNuSmBibolnU7P3JPAQ3XrQUqkjMUXPmVZSyqA8R41maNF6YM
 oKVj+Yc4wZH5P+hWSsYLAYg=
X-Received: by 2002:adf:fc0e:: with SMTP id i14mr3129525wrr.173.1631689454892; 
 Wed, 15 Sep 2021 00:04:14 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id y1sm3531747wmq.43.2021.09.15.00.04.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:04:14 -0700 (PDT)
Subject: Re: [PATCH v2 17/53] target/mips: convert to use format_state instead
 of dump_state
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-18-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c42b6131-43aa-dcf8-934f-1a8967c954f4@amsat.org>
Date: Wed, 15 Sep 2021 09:04:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-18-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1ZU0KU+OC7xS

On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  target/mips/cpu.c | 85 +++++++++++++++++++++++++----------------------
>  1 file changed, 45 insertions(+), 40 deletions(-)
> 
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index d426918291..9ced90d810 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -42,76 +42,81 @@ const char regnames[32][3] = {
>      "t8", "t9", "k0", "k1", "gp", "sp", "s8", "ra",
>  };
>  
> -static void fpu_dump_fpr(fpr_t *fpr, FILE *f, bool is_fpu64)
> +static void fpu_dump_fpr(fpr_t *fpr, GString *buf, bool is_fpu64)
>  {
>      if (is_fpu64) {
> -        qemu_fprintf(f, "w:%08x d:%016" PRIx64 " fd:%13g fs:%13g psu: %13g\n",
> -                     fpr->w[FP_ENDIAN_IDX], fpr->d,
> -                     (double)fpr->fd,
> -                     (double)fpr->fs[FP_ENDIAN_IDX],
> -                     (double)fpr->fs[!FP_ENDIAN_IDX]);
> +        g_string_append_printf(buf, "w:%08x d:%016" PRIx64
> +                               " fd:%13g fs:%13g psu: %13g\n",

IIUC QEMU coding style, the 2nd part of the format should be
aligned with the first part. (multiple occurrences in this series).

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
