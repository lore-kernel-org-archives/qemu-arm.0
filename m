Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp622862lfl;
        Tue, 15 Feb 2022 14:15:08 -0800 (PST)
X-Received: by 2002:adf:80d0:0:b0:1dc:90a8:4a1d with SMTP id 74-20020adf80d0000000b001dc90a84a1dmr92152wrl.180.1644963308574;
        Tue, 15 Feb 2022 14:15:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644963308; cv=none;
        d=google.com; s=arc-20160816;
        b=dFI/Q45XzUy1CDqEmA7S5SLlq6IqZtaVrNUo2ffPeaFaKcbwpLzSlCizgNqC+mrc/c
         nW+hLd+Bf9VSk97j/pFIpei7OeE2UAMR0iVXDr9K2F2rSRwbrfnfMUZ+t29jp2loFJBI
         8xdlk4OqcoDS7kPla+GwurQM9J6DhoiuAwk6uOi9rHGFZpO84wZgktu33dIl9xDcmD1M
         68yItJUFMg5af6ZJpDzcbRu7tGjmmd322JvqJALSo3ZnWb/hFD4xAXkHEkodas1WjtgQ
         Ytf97Wyk5sFwJAM6Kfb7+qW+UIDRGowiWHFmOrGfJ+xkygKGLfMoL/zXKdj9QA0jTIRa
         88aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=73ERh/2jSItukooRHfcvS8fwW4uA/1jedT0jBkNKpRE=;
        b=ux49tJMuI/wdCV7vKKDtDkOwSSEh/AB6Iq5htCbH+xcRXs2NotyTYCdUgGYeICzi2Y
         F3BAX+tDq+bzEXYneZWPIngFJ9lElNKmjt0S6Vhk1SfvEOqJklkowNBqft8AGJr5KQIZ
         ZCK4pMiccg//emQFpNIqli5BURwHXal52DSuDa45R/OBIMgLKRUZfI1fK4tD9gvjeX/y
         KLLORQu3QepuXyER4j7i6gztffInR9NqjZGWoQs8Ad0pi5yC6QjBzMCPKbfdWbXayNC5
         q3jkF/sb0hzb3ZXBLr6qucqu/0cRIvVgfKJ/K8xbbwpKv78Q7CgY9lQ1kqLifKPSRtTC
         Vx8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dp1YyQO5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w15sor20586361wrq.57.2022.02.15.14.15.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Feb 2022 14:15:08 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dp1YyQO5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=73ERh/2jSItukooRHfcvS8fwW4uA/1jedT0jBkNKpRE=;
        b=Dp1YyQO5c0ggZ5qWeROx+zTzauce6AHnPgkVBfrNvp5kGBcYC48xUHP4mKNIoIBtIl
         IL3QR3vRmjjxgR3XbIBFSwI/+r12dKgxRpHhAe/ekw7CVtcUTGDXBWhIJw+/31NDb2tP
         oQHTsl5pPAtr+hrg1/2TWZdttwBz833L47HzInzmNE5Z+tdXIwFNA1k4NZzLJdRQRX3g
         TS+QIRtJGjSXf/39vsnRYjWBHSIlX7MbqkfHiy3+dnr0/O4DIT6qP3S01GIB3Iwwc1mO
         AcAmgvE+HDTQ3Nqy++/65GEyw35fBzmOIi0fxNLESMNUFvjJKbYrKM1cVrQvYLErm5Hq
         4qeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=73ERh/2jSItukooRHfcvS8fwW4uA/1jedT0jBkNKpRE=;
        b=dA9FALcD2laLOO8/yBZbaHo4CiloCPjx8ZTCEk1QEnPD0qO0pdOkrLcW/By93vNEsf
         eCp8uNvd0zv/JdZ3tQqXsH3N30/7r5giJqtABgQMBQwkmG3/+maA0tLGWLykbOpVeSW9
         YmULwh0X3QVZWu2nk/FANATNlesuwr8InCtRsvTq1k5n4aBRztrIcC4/J0tD8eBlmUu/
         ECsbkybRPyh1fkOAJK1pAI3D4uNgtfyalVzQ9gKdFZvvpLy3Nf0cnE2fdnYPZ528hGZ1
         u+X5rcQwslsfL1JjN3ynaIwIiE5OTeYwJS/EmSB3rru4d8eAgUGeeQMO0NGKTAhBwohX
         YB0A==
X-Gm-Message-State: AOAM531810ZhzP2y1V4ZeD247/QH6gEzrb+0eJObkxodtEf/0gAPBzLV
	y5cp+23OarCBnr4qksbuxacrRfngXybmi/UMZ5fCueOa
X-Google-Smtp-Source: ABdhPJyEHaisn6WBC8O3QHG+LMgvQTyt1bj+nv3dDBKkWzkWGfzoroZ5MkwyHac9/p3RmHh0N6VNUydbGyHSjGzEQaE=
X-Received: by 2002:adf:d20e:0:b0:1e4:a0a0:9da2 with SMTP id
 j14-20020adfd20e000000b001e4a0a09da2mr30584wrh.319.1644963308365; Tue, 15 Feb
 2022 14:15:08 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org> <20220210040423.95120-13-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 22:14:57 +0000
Message-ID: <CAFEAcA_Cuyq-Rtkf46a3z2Y_Jwd_qW_7zcZ0ybG-8sFf+X1qqQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] target/arm: Introduce tlbi_aa64_get_range
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: bIaDZ311evUD

On Thu, 10 Feb 2022 at 04:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Merge tlbi_aa64_range_get_length and tlbi_aa64_range_get_base,
> returning a structure containing both results.  Pass in the
> ARMMMUIdx, rather than the digested two_ranges boolean.
>
> This is in preparation for FEAT_LPA2, where the interpretation
> of 'value' depends on the effective value of DS for the regime.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
