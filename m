Received: by 10.182.105.169 with SMTP id gn9csp1592878obb;
        Tue, 27 Oct 2015 03:15:51 -0700 (PDT)
X-Received: by 10.31.130.71 with SMTP id e68mr13126950vkd.11.1445940951748;
        Tue, 27 Oct 2015 03:15:51 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x230.google.com (mail-vk0-x230.google.com. [2607:f8b0:400c:c05::230])
        by mx.google.com with ESMTPS id x10si22431930vkd.168.2015.10.27.03.15.51
        for <alex.bennee@linaro.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2015 03:15:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::230 as permitted sender) client-ip=2607:f8b0:400c:c05::230;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::230 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro_org.20150623.gappssmtp.com
Received: by vkgy127 with SMTP id y127so117404718vkg.0
        for <alex.bennee@linaro.org>; Tue, 27 Oct 2015 03:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro_org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to:cc:content-type;
        bh=ikYEqtzNl95aQvJF8YCkrBREW1XLSqRbIONgLN6E4EY=;
        b=RqeRpch6V54bSLdUiY1Zmi0UvSOX3EnR3N9SfqQeh3rDKS1y2kon9cGG07GArDQreW
         3T9tXDhhaaccPTNt+1YIBopRY71MF5Bzemrke/6xaNe15OdfcFzJwFRbYoZiSrrhSUdB
         pBFwrEt7LXBuA47eW+iRNJyD/VFkbAjCTHW1ofhfozkdyUBLHZyIaGMvObNsWn0j2IeI
         BEll/+FVoPfBHea45auZvO+KcTv6TC1q+sx1RPHrboGFwT6VLkYJ/lqU4NNv1u20JhD/
         fRnu7SRZdqmokzIy0dU8xeN7AKjJAZfPPhIJD0/uIGKXK6JhNjNnw5xXbm3eS+E75qfB
         NN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-type;
        bh=ikYEqtzNl95aQvJF8YCkrBREW1XLSqRbIONgLN6E4EY=;
        b=Ptj8kzWMdcuwlrseCLMdGlYD6pt569U7u+nTf5kmnWtqCVC6+UO1i1ue6i5L5Vu9fM
         qx9K6FT57P4G11z/kQjPgqho4Tm7+Cq6aMdtGucFa5XZ3rOz7X/2gpg80GD3IFurFqG/
         v65+0k99XirMgPWNRg/b3BPFnmFfaY21Py1rdULs0CLhxdqG/kPWDOe3Eoig+SHqyer4
         G1Z/aCsV273mObWkyMyOgpPhs2da51rQjmRBhDbZAL4ofd6T1rMv14VF0JT5WH7TauPU
         AR6SuiKXF9g/nLRk60hz6aHek7BWHANI4CVY/craj95+tZARKEC+5ucpmINzbfwepXA3
         KJaA==
X-Gm-Message-State: ALoCoQnUNnvN5KO/rBA76I2B6vyEwGgw9FQ6VYfBfzp+Epzi4//t5krWmbYReLWkLOkQ1KME00ea
X-Received: by 10.31.16.3 with SMTP id g3mr25338785vki.83.1445940951483; Tue,
 27 Oct 2015 03:15:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 27 Oct 2015 03:15:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Oct 2015 10:15:32 +0000
Message-ID: <CAFEAcA-s_hSQiLCkQDeX2rR12PcPx5yZ885yZy7C=ZWA5DDbTw@mail.gmail.com>
Subject: proposal: new qemu-arm mailing list
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Peter Crosthwaite <crosthwaitepeter@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-TUID: GCiU86CvRfPh

Hi; it's been suggested to me that it would be helpful to have a
qemu-arm mailing list, along the lines of the existing qemu-ppc
and qemu-block lists. The idea would be to get people to cc the
list with their ARM related patches, so it would mostly act as
a way for people to filter their mail to separate the ARM stuff
out from the qemu-devel firehose. (Everything should still be
cc'd to qemu-devel as well.)

Any objections/opinions?

thanks
-- PMM
