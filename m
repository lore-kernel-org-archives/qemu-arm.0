Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1414249ejc;
        Mon, 16 Jan 2023 05:49:42 -0800 (PST)
X-Received: by 2002:a17:90b:1058:b0:229:990:de46 with SMTP id gq24-20020a17090b105800b002290990de46mr16544004pjb.33.1673876982448;
        Mon, 16 Jan 2023 05:49:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673876982; cv=none;
        d=google.com; s=arc-20160816;
        b=Z9pjaCZeq3h6jRXn/v8glSfhHejicie0XzOYZIeljmlh3zlBRcJAhFnRdyB1oP28b5
         zrbmOCye78rCokuK4xZTjymr16bL9GRSij3Jaw005X9q8QnbrH7re61nKzPZ8iSlnu0U
         ncsYCQMIGR/gQn3DFXDlMltlXabBH5JCR9inexRhhuUnB2EE1IbUa7jYyLNrF/6hC2eP
         WNzMGiSF9tSR9t4Qkdx3NVP06wT3CIy0punjuygqtqu+7YPSpN4zMv2KXFdsWwvl0EvW
         broCbXGSAUHDmdozB/fAF+lBS0p2AM/lTfbkXGlX+V51jwf8pZI0ZaiLEe+bViaXMJeE
         dd7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a3CnBVOLCP2dM6Ha1kb4WheMOMwZ6ZjS+Mi3lpu6eYI=;
        b=dwU55cFnm6N37TJtCPoqnIHnCbXloaTduZ40Df8VlRt7aWkGcU4OxkyUgd+tYbLBzQ
         Lj1er6kbTHm+KIFwrIAiXVoqh5IbnJYqaDtvpEUSgbzD9ySXjXEuaszSLSB5ETtOxGH8
         oAomUppzaYGGXbdHd9Fum07Euj+IlvO66Wl+zW7Ds0T+p8pa8LfKGyVlDoBb5riFtxvv
         YgdvpavXfLm8DD+y+QP6j9PTvgPZWOZ36K7OuTr4jlp5RDniExQJRKUtRA4Rn/8eXdwq
         zFjjkdM6k6ZeDu/rtTsgk4YO74db+QWzvq6klONUXr4qgfHsAGpG9/mY8gJbI6CYC4BW
         m9Uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f7Y1sy3Z;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v202-20020a6361d3000000b004c76dcc9998sor2781947pgb.0.2023.01.16.05.49.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Jan 2023 05:49:42 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f7Y1sy3Z;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a3CnBVOLCP2dM6Ha1kb4WheMOMwZ6ZjS+Mi3lpu6eYI=;
        b=f7Y1sy3ZvKh1ah3gIMMcEMipeDAO++/fR90DEUfVzzFy65AqEGwRRljHP4d6pk3UVv
         Kg+hxlEJSxWJOTGQCpSmwTITnJHGAsq+wQlbnwsq7b7+2RpoFdV0MJDy1bUns9MduTQt
         Gcv2NccolyAq9t7BGbZsxdhNLuVm+dlc39evbMxyi85F0Dx1jc5x45xeO1E6Mm/BTG9R
         +Qd/bKSHgflWUJbVtnShq4GLOfsY9G/wmIZYQVHvCTpXLrQnltWbT2gJIRoM0ZcYRhil
         2Lpm/1WR3Tw9KRdCTriGEcgLUrP8kr3EsGbb0Z2WsMHljfDlLg2whgF+25CEsBrDR2SU
         hcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a3CnBVOLCP2dM6Ha1kb4WheMOMwZ6ZjS+Mi3lpu6eYI=;
        b=ZDGYMCtM0TFMSQlDDz6EaVzG+y8Ipga+f1BvV+ZbG1Z1sNcJkpVVOk/cboxbInN1Ra
         yJMjXh1vqK+aosutsdWXuAzciEO8GbLjFiolkZBVjzhRvYsKwZ64ZZ60Jt27Xt3A8IsF
         0MWc2qz1JgqyyM+xwiFYApiGwwwGuIAbNaXcW+T5qXMM15OWN7S/yjLmiTNabvKPNJ4n
         ZtOglL+EMtoRK2ztbTE8kGtjNRqCGb5DAKBu7wch0ZXJFIHV4U91ge7ObAD+emS5+4Sb
         rGOfgeLymekVq0iIGLmd74N8LHPK7s6U+bNKRZK8WGj0s++AIfl9RcPz+HnFmLL5jAMR
         GMCQ==
X-Gm-Message-State: AFqh2krdpbRiddzf3XGuSLcjzbK1lC2xmloj921zzH4nkGNwUNn/v00G
	VYy5WqbaHnDlEsd+ibkKB34V8Gu5pvhizx8ebqzHphvS
X-Google-Smtp-Source: AMrXdXtKNSYAsXvpCf1U94N5to2+0tLVgM5NYG1i7LNtkYG5aQRZyV2UhmoSToiTUVHT98A/jdoKQcVAuATR+Ac+XmE=
X-Received: by 2002:a63:9d47:0:b0:4af:9f91:54d1 with SMTP id
 i68-20020a639d47000000b004af9f9154d1mr1862211pgd.192.1673876982035; Mon, 16
 Jan 2023 05:49:42 -0800 (PST)
MIME-Version: 1.0
References: <20230113140419.4013-1-farosas@suse.de> <20230113140419.4013-21-farosas@suse.de>
 <bb5f5cd7-6d53-eb69-3e79-db95c9734f07@linaro.org>
In-Reply-To: <bb5f5cd7-6d53-eb69-3e79-db95c9734f07@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jan 2023 13:49:30 +0000
Message-ID: <CAFEAcA-XXWg+NXyFJVECfomGHAkytW9WZoVdE48Hrcmyhs4nHw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 20/28] target/arm: Set cortex-a57 as default cpu
 for KVM-only build
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
	Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>, 
	Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: MHm3y4QWTYdi

On Fri, 13 Jan 2023 at 22:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/13/23 06:04, Fabiano Rosas wrote:
> > The cortex-a15 is not present anymore when CONFIG_TCG=n, so use the
> > cortex-a57 as default cpu for KVM.
> >
> > Signed-off-by: Fabiano Rosas <farosas@suse.de>
>
> Ideally there would not be a default at all, requiring the command-line option to be used.

Effectively, you pretty much do always need to use the command line
option, because almost 0% of people wanted the cortex-a15 at this point,
even when using TCG...

-- PMM
