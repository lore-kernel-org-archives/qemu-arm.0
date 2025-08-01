Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8EEC87FCB
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 18:28:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhuTn-0001EB-CH; Fri, 01 Aug 2025 14:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uhsse-0007Pd-0K
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 12:45:23 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uhssb-0003zm-JR
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 12:45:15 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-71b4fc462ddso15774387b3.1
 for <qemu-arm@nongnu.org>; Fri, 01 Aug 2025 09:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754066712; x=1754671512; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aSu0Lh6UVCZWXGQ6NawRS/oExQyBCp5VkeGOgwYHlic=;
 b=RRQhIOGXIf2xHJ+hj8q+eZ9wfTo8ASmfQRZgtm8O8HBdyVaTbKDD8V1+lW/DpBU3Jd
 Ag6EVXgJ8XGVanhyHKg5z4KajwlDaYZRoBGmb/oc1UadctSleVkXLR8Z3pOLkeTDtAYI
 vYj/+Pl45Vu8sKO+AjRmaF7H3LQjjn9HrB3+wrJzBcHf5BwbtFDAQtfS7LSRCWBl52uc
 UAt+m6fJ4O1tndsd1ppRbJF5Xya2lMd1+ETR6cCPSH+/If+KuGYBQDqv0D0MZVDD9Ryq
 jPnTh1BMN2hRMzxqtR/8m/i/rbgRAMfNydBckaFXDkqjm82IjEQXnjcR2F2USAx4jug6
 z9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754066712; x=1754671512;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aSu0Lh6UVCZWXGQ6NawRS/oExQyBCp5VkeGOgwYHlic=;
 b=NSqn6dldPX8vqRbAbajWMN+aa1Sn1r1tlUzdUTFBKkav24dk4xKQ7bIFYyV9bw9RUV
 F2uYAVBkkMAtYIE2RwLb93hzT4N6eCJpDn1+wjXODFB3feJhQ8eU3ErSbZHJlfcPYwiO
 NN/MyvhQ8IwUCyftXW4IJnHnHXakmzL6R1PceIU0N6ERBrVXlSXXX/FwKItHP1UtqlS/
 k6lWIlYHO7dJdu9Q8LxQif3XmZg2UyJ6LeiGSTl0dgwcs/qLZUR9n8MR21ebHLKeCAMR
 se/qiQ/Ly3EBW452/eEM01A7pWrUwLummH1b/3L1/b55ygLWhCzGjHPTqAyEJcd9h8/n
 V4wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRjTFQB0lqjP5z6aQYeh6apHAElJX+3TRblpBKMF6frE2e05sjcCyjwYF/N0SOd3reV6FkRE/pBQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy3nnTCnD7y7vqrZmGj5G+M2SrUrfuYoVt7JzGjoRm3pf1ERbs8
 DZfUL4trh1Cgsj/U5ZogxDxUh4xcWtw+c+jobXbtk5lFd0NUi6gVJs8L3p7VtB8/2YOO5vKt+yS
 PERpSXEEhb6/Hw90zzpxNtjuAjS8wVWYsHJCWJ/x5LA==
X-Gm-Gg: ASbGncvBcEvbP5mQJ08bRE0X/9UxXMJcuI9RddueAtnzY9PUo6HpLIr42/NtHvv5ABH
 P9uw75tcU4+midlMUm4GtQuSrX3/9YXALXWFgpPq3sjDe8pLiwJ28c+or79+6fx+sRkOQ51oE8Q
 bQT7/lcM24kyisiPj+8gTLHNrcoqtw1mqa8PUtvJ/C+T8O0Vobyyb+z4AphOUdq6LZ9xAdNFzAg
 mHKOTEe
X-Google-Smtp-Source: AGHT+IFXEy0sTpmOlg0a7QU4ytKQxQ7N2P9DPIsneGqDHmDICrMICCGmT2x9s3wckFjICHzXkQ1SKnITj7HKJ1prrqM=
X-Received: by 2002:a05:690c:6891:b0:71b:4739:9d67 with SMTP id
 00721157ae682-71b7ed016afmr4343777b3.4.1754066712067; Fri, 01 Aug 2025
 09:45:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-48-richard.henderson@linaro.org>
 <b2e40787-6043-4d4c-9cbb-731d0e92e25c@linaro.org>
 <CAFEAcA_9tkv1EoM33=G=zW6Pw0gBirvjs-SsDaC8ar8feyH_8g@mail.gmail.com>
 <2c337408-5caa-4e24-a8dd-d947203a1dc3@linaro.org>
 <CAFEAcA-LmS0dus5ZW6P+-VXkw=m4K3MaE6O+Qtj5i3H7ULJFFQ@mail.gmail.com>
 <cedc5b94-78e3-4d9a-bdd8-60c82673c136@linaro.org>
In-Reply-To: <cedc5b94-78e3-4d9a-bdd8-60c82673c136@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Aug 2025 17:44:59 +0100
X-Gm-Features: Ac12FXxTNpE5QMWuNIBTE0ckr-9NIXZc-hsQCOc3g7x47w5B7TKnGlJ6qi-g5so
Message-ID: <CAFEAcA8j7S6qVxmd8dairF=4kpn2=uBeFFxY22M5FgyTnjcJ+Q@mail.gmail.com>
Subject: Re: [PATCH 47/82] target/arm: Expand pstate to 64 bits
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 1 Aug 2025 at 17:41, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> On 8/1/25 9:37 AM, Peter Maydell wrote:
> > We do at least define the fields so you get a nice view of it:
> >
> > (gdb) print $cpsr
> > $4 = [ EL=0 BTYPE=0 Z ]
> >
>
> Do you have specific pretty printers installed? On my debian trixie (gdb
> 16.3), there is no pretty printer for cpsr by default.

I'm not aware of having installed any. This is
GNU gdb (Ubuntu 15.0.50.20240403-0ubuntu1) 15.0.50.20240403-git

I was assuming that this was just plain gdb doing something
useful because the xml defines the field names and bitpositions
(at least if your QEMU has commit 63070ce368e1a where Manos
synced our xml to upstream gdb's to add these).

-- PMM

