Received: by 2002:a19:791d:0:0:0:0:0 with SMTP id u29csp1002805lfc;
        Fri, 17 Dec 2021 14:34:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBHKSuN2TEPamsLmwWNwrVsIbRH+AoFnvo7weFwLpaUf0hegJCC6GAMfWUwVSE4C0zPmeY
X-Received: by 2002:a25:7e87:: with SMTP id z129mr7808046ybc.719.1639780493898;
        Fri, 17 Dec 2021 14:34:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639780493; cv=none;
        d=google.com; s=arc-20160816;
        b=wPofR+S7ZnBn9cVRygHOtS3ShDXHHpWpqIGNp9QMSDfCx3CTM1rD7tO/EsyZRSG/Zp
         mjLLZ5MBL7nb6HFyGTbe2j6NPxOYTil6Hzn270eVHtfyVHTn5iWfpuSnXA3OxRinCqfv
         +9Cq0IzbR+w4+d9oe2+loWDKjkg47KghGWG7t+eDMWT4KKVGzvoMEtajo8Z98MS6pT/U
         biiKiQsENzOJjbv2iA8DlGLihhvZDOXT+lX24Q6GqAztTgKuZ3GeNW7L2Y2oKUOD1kvr
         tTtyWfBXDBkhUCE5TLkLHg22kXzxrjIy8sQwwdvQ7c7HctdEXyTIaJVDQb7M8NfnXDHU
         tEYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=UlftqpMsBSng1bdVgYdeQvpbHbf+X72OR+GsWsjEswg=;
        b=XSPyzvEWw32I6itQeBB0yByw3WUmjww/Nn6oRJl1Cx7XtFQHlglrPPcCeWbALMTmpy
         17Oti6Xm6rSY6BFDROUZP4g7S7tdIJkyT+6gm+/09+QTCfMBT9zqx4LBgji31Jq2YPMF
         eo1+VUID7VEmZMTF7TDRlMtQIKbi8SYvrLDyz7kAtFMg758R6g7srJ4up/8OQGPYBt3t
         UYC72Lj185DGC6z7tS2is2HFGJ3hqvhfKvsexaxe9VVlPlOOGZvOuYqThPPsejfcxAH+
         b1E9jzBhAAR1BTZkXCk2ZuIQbwKUbvcAhjhFxNUEU9lDmZ4v511+M9EDXXsZJXwFDRqK
         QWYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l0dmQ3zs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9si8189742ybp.376.2021.12.17.14.34.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Dec 2021 14:34:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l0dmQ3zs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1myLoT-00040Y-Bg
	for alex.bennee@linaro.org; Fri, 17 Dec 2021 17:34:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1myLoK-00040G-J1
 for qemu-arm@nongnu.org; Fri, 17 Dec 2021 17:34:44 -0500
Received: from [2a00:1450:4864:20::434] (port=33454
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1myLoJ-0000I0-3R
 for qemu-arm@nongnu.org; Fri, 17 Dec 2021 17:34:44 -0500
Received: by mail-wr1-x434.google.com with SMTP id j9so6755999wrc.0
 for <qemu-arm@nongnu.org>; Fri, 17 Dec 2021 14:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UlftqpMsBSng1bdVgYdeQvpbHbf+X72OR+GsWsjEswg=;
 b=l0dmQ3zsAIQqVCAadYlJD/h6dMUaLGJstdbfOOvmooEk411Mt8zIRPr52GHfdUFW6B
 7DHlk6VV9cQVeM8/DYRZ1vAFJBiDcWZSrJb0HdX1k2wWIiNdO8d0cpARC8SPzE5UugOj
 IjZxEdDq/EAdBjDkfuNJv8GT4RztlrErZvT70sADcZKP10mNN6vF4Yor6G3hA5peeI1f
 2ZsVlvMOR1a8iPNCK9WP3ajMii7Bojv3JWHyQ6rEQXUfAlQW5EVuiS7FBW8+/bCewduE
 MLgckEzLZezxL9dcC1Bh9K+tfCYMypgPDI5UTd4BKXl5QktIIzrBGaDnXL3yBppQe7bb
 v7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UlftqpMsBSng1bdVgYdeQvpbHbf+X72OR+GsWsjEswg=;
 b=lrEXmblmfCu9GLh/TKRhgQkvoEDrMY/MNFmCEsCtwksSl4hzThsoTMiNG9HiD/ih2X
 +UheoYlmBDjI3Wr+0dRru9iV0ZVtsjrFfCxFvyXdr2wQI6Z/AlA9Z4FHQKv+cAbMPXM5
 d1MPp2HgtGo7lcoWiwQTU2e1hsbkLinvkwUCSwmIq9GiM4nJI2W9YL1XxegOvMH2DwA8
 S6jWlXA9QhI6b2gvHJcnDGSOnDlO2kMmtm9BFF0gAFRO2ySHSrFNiSTxylnZIBiZ77Xw
 4mQL1x38mHYwI8i77MVIcA8hbaH05ERHQRgF0KdFw34p5abdVtd08vlR5IoGd/XEao0g
 rhhA==
X-Gm-Message-State: AOAM5329TFQ1zfa+vGFlvQEJ+d6rvDgdpj3+hhcKVa0OW3BnIehEyHnE
 wNtdqlRml31tW4e3p8mZAuHjBJv/7pl3HpbDYJGL/A==
X-Received: by 2002:a05:6000:3c4:: with SMTP id
 b4mr4206740wrg.172.1639780481107; 
 Fri, 17 Dec 2021 14:34:41 -0800 (PST)
MIME-Version: 1.0
References: <20211215182421.418374-1-philmd@redhat.com>
 <20211215182421.418374-4-philmd@redhat.com>
In-Reply-To: <20211215182421.418374-4-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Dec 2021 22:34:29 +0000
Message-ID: <CAFEAcA_UKFHT=PbwNtyqV4G2Vdw7LVUjUj_X_DZ5Kk6=yF+EBg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 3/3] softmmu/physmem: Introduce MemTxAttrs::memory
 field and MEMTX_BUS_ERROR
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uTeXPLF/mS9y

On Wed, 15 Dec 2021 at 18:24, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Add the 'memory' bit to the memory attributes to restrict bus
> controller accesses to memories.
>
> Introduce flatview_access_allowed() to check bus permission
> before running any bus transaction.
>
> Have read/write accessors return MEMTX_BUS_ERROR if an access is
> restricted.
>
> There is no change for the default case where 'memory' is not set.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/exec/memattrs.h |  9 +++++++++
>  softmmu/physmem.c       | 43 +++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 50 insertions(+), 2 deletions(-)
>
> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> index 95f2d20d55b..f0063583ee2 100644
> --- a/include/exec/memattrs.h
> +++ b/include/exec/memattrs.h
> @@ -35,6 +35,14 @@ typedef struct MemTxAttrs {
>      unsigned int secure:1;
>      /* Memory access is usermode (unprivileged) */
>      unsigned int user:1;
> +    /*
> +     * Bus interconnect and peripherals can access anything (memories,
> +     * devices) by default. By setting the 'memory' bit, bus transaction
> +     * are restricted to "normal" memories (per the AMBA documentation)
> +     * versus devices. Access to devices will be logged and rejected
> +     * (see MEMTX_BUS_ERROR).
> +     */
> +    unsigned int memory:1;
>      /* Requester ID (for MSI for example) */
>      unsigned int requester_id:16;
>      /* Invert endianness for this page */
> @@ -66,6 +74,7 @@ typedef struct MemTxAttrs {
>  #define MEMTX_OK 0
>  #define MEMTX_ERROR             (1U << 0) /* device returned an error */
>  #define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that address */
> +#define MEMTX_BUS_ERROR         (1U << 2) /* bus returned an error */

This is kind of odd naming, because MEMTX_DECODE_ERROR already means
"bus/interconnect returned an error" and it generally translates
into what at the OS level gets called a "bus error"...

-- PMM
