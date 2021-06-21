Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp2385347lfg;
        Mon, 21 Jun 2021 13:00:07 -0700 (PDT)
X-Received: by 2002:a05:6512:dd:: with SMTP id c29mr3917417lfp.252.1624305607154;
        Mon, 21 Jun 2021 13:00:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624305607; cv=none;
        d=google.com; s=arc-20160816;
        b=rVMsNAT5LVaLi4/njiL/58RRJrZlhJcmgnlL6/3oAOC1mQQmKash6xNoGLL5bTAsUp
         7mtdx3QOU9URxRpOyfYWQ+omBswPqgkVMaqkMcTF7mi5C730jmze4FTEMMUZJdVIHqQG
         IxkldZwDnFe/e86Zho4D3gB+0RIgk3M/GUygjx6ZC0Rd1mRMBnRRP5kFX7sOYS/GhZb5
         Hr3jL2dV539FftHG9QvZNYp6zJdPfE6R1Zxt6zHDmKh0MDnEWuyuFzj1MhsqCNG2XfMn
         WphshwRquRRkbKsWU9XHjpSrgs0/PYoH0WPyIgyWebqx/Hykxv/Q9muQCoNX/VgggA3K
         Ym7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=/xsQ7RCoZ6S/LFZDo6TPvN3p5NYDXQ1OP/BT24zoCIQ=;
        b=r8BvWQG0XjtJSS6Klabb6aOe7jNlc14nStclaTbHDel5SGV+bu8kjlobYIcn585XgS
         yIGAmfOEvttQnaBG0ikG32P2DTpIg5dLXg9TYHU+9NdORIna9bXF8uSnThPyI9aAYjkp
         weeucInKjEhjmkWuyvzVqjKEWOcFQJqF4p7zIR0uVsddySVpu8gzuLXGofwULlbzM6yh
         HDf9cKnWIS8n7ZSdPjJqyMsikmWiR9v4Gf4wemBPb+zSME5AYsGxagAt+tUzsCjZgm8V
         HPtTkcfH36/XyvqKRK5CnpP/8Wf4v5PqOg8hSzrGuJJKTQfjoQETZM38pWP3MbskGQMk
         sxYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=WINReIdo;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l14sor665387lfc.131.2021.06.21.13.00.06
        (Google Transport Security);
        Mon, 21 Jun 2021 13:00:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=WINReIdo;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/xsQ7RCoZ6S/LFZDo6TPvN3p5NYDXQ1OP/BT24zoCIQ=;
        b=WINReIdoAQmDXlbhipMEL+DMmJVmoai4vK5AZEQoNzrOFoE54rAwI3cO83jXjGR1WD
         l66kEbbanTSqdvqE0xYyt5UF/Ujm81jrw0paSSrlFGFOt8MB2koKZq14aJtX1yGCIFjg
         QG2EJUxU35d3M9ii1dVgrjEhBu/7638ClrXTEnUtFmuGP5QHPDYin5iNfeOPLA2qqHYd
         4SpAuk2lhK5J0h1ygbYE2gZ2DRYprtbPTSeCOjqrgHThrR9arckJbCXVvf4Xigjz9kC7
         xKVagoyIapv6+V5q9u9Ckd6iG50kjzrTmyYAImKWxMxTdjHrAe6+9Bsxwo+0BGOKZIvY
         Mo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/xsQ7RCoZ6S/LFZDo6TPvN3p5NYDXQ1OP/BT24zoCIQ=;
        b=enYmJYv4kwJ5ZXAFoQRmmjq0CQ8o3fuCCDb7t/WSq4/ajGV+vAcCrnLY3+i2Si05SU
         a8hxLl2IKXD5X7/mPVUB2WHWhJ+CHW6rJsSzmcI3NP+GM/rFY5550vl5mDXHsBly+qtX
         TmtRo83WGNurW6lbjArTv0yEm/3SKm7qOmyUhMiAJgEL+qpN99+NTbnIPrYJHgcJy8xk
         ZmLwMhDLbkV90iTEUuOICWZpYNUbl0P/uxSRhhv5pDW4zjZhjg7VrDAcSXhscqpjepuY
         wTE9hYlzuE8Zzg7RGVRy+9d8cAqX6+VgJqUnziTyYBJcxpD9x9cG/3lbP/0JNTDp+MzE
         Zp0w==
X-Gm-Message-State: AOAM531upLCDsalyspOXRKpN1b0qpfuo5jawG9YnS1J2YSLMfbGvnobi
	HoJRrJMFSTLOhNYX01WaLi8=
X-Google-Smtp-Source: ABdhPJye7R1lu28nzjkyBDraJs7zu6LTIxNpgPI0ycANGc9k6kZXInt78S8VCgdRYmxSGQSrwA9cPQ==
X-Received: by 2002:a05:6512:261d:: with SMTP id bt29mr15101576lfb.231.1624305606822;
        Mon, 21 Jun 2021 13:00:06 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
        by smtp.gmail.com with ESMTPSA id h22sm2472178ljl.126.2021.06.21.13.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 13:00:06 -0700 (PDT)
Date: Mon, 21 Jun 2021 22:00:05 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	thuth@redhat.com, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	pbonzini@redhat.com
Subject: Re: [PATCH v1 2/5] hw/arm: add dependency on OR_IRQ for XLNX_VERSAL
Message-ID: <20210621200005.GA3586016@toto>
References: <20210621152120.4465-1-alex.bennee@linaro.org>
 <20210621152120.4465-3-alex.bennee@linaro.org>
 <d6012d09-a9c9-d7f2-9640-80f368a48ec0@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6012d09-a9c9-d7f2-9640-80f368a48ec0@amsat.org>
X-TUID: RZmvrrMkck/N

On Mon, Jun 21, 2021 at 09:00:22PM +0200, Philippe Mathieu-Daudé wrote:
> On 6/21/21 5:21 PM, Alex Bennée wrote:
> > We need this functionality due to:
> > 
> >     /* XRAM IRQs get ORed into a single line.  */
> >     object_initialize_child(OBJECT(s), "xram-irq-orgate",
> >                             &s->lpd.xram.irq_orgate, TYPE_OR_IRQ);
> > 
> 
> Fixes: a55b441b2ca ("hw/arm: versal: Add support for the XRAMs")
> 
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
