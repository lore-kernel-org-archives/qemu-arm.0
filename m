Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1822130ejy;
        Tue, 20 Sep 2022 07:26:21 -0700 (PDT)
X-Received: by 2002:a17:907:2d2a:b0:77e:def7:65e9 with SMTP id gs42-20020a1709072d2a00b0077edef765e9mr16995196ejc.85.1663683981641;
        Tue, 20 Sep 2022 07:26:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663683981; cv=none;
        d=google.com; s=arc-20160816;
        b=lAoXVVl+BA6D1gZHdp4G8PCuHzOd/d/wTAA/3KtTMR9CPw65WbrQ72C9zjgWKR0G8U
         9+g3anho8kc9eTof7WR4DYAZmEY9YiqrkuPqg6CLgYIUhkEe0ld+gZNaiIcGZ0ATvAvx
         RHAIv5tYOLa8m2woQOc/V2164zxh6iuZkYEfVaZ9BMwswb3ziHeq572QN+cJHUytGcl0
         hPPNe0+wMlrXADUPnsscXm41PxO/C6AQE7gGmsE5/oqzo15VsWC707pFuIvbMNg/DtDW
         tRzW61DSH4omRqAw/Q5ENYiBDJdHGfjsY7ybmlWZ5tEaaVj8gEvuLSM0jrtM1MtNvXYF
         hWLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ArY7B3RL51SioJr2VWCBecJ96XNAdUeg1sJSFJih0vA=;
        b=n/NsLVk5Sd4FILONpFn9FGXCjYt4IXw044+Pc5boeUgb1JBkAQkG5sahhoIkUPV6m6
         Ug0HDEi4URfti3/RnhQkuxwCYPIO0Yrt4TNSU8ar/PRmT+ZQVAL6L+ytzVAHgDsJ9KoW
         R7HPFG7IIsGGUHJetk2EUgP5/+YTPvtN8naLgu2lxpeJQLOO5wZkFrtoHTUA3HWl+AEU
         7Sd4RmEvleHQUexPEkdkNjg6vFJ+0sGEeCRjN4pq+t14t/5XzMDbGTIghsvVEOmw0YiA
         zus2LYMQKjVrugUWM6vzsbTqFBECs/BixS5gN0OGHGXcsX2qjJnGlPCFmLZwLnoFVEyL
         i7jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eFW431fA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v23-20020a170906489700b0077084935c9esor820038ejq.61.2022.09.20.07.26.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Sep 2022 07:26:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eFW431fA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=ArY7B3RL51SioJr2VWCBecJ96XNAdUeg1sJSFJih0vA=;
        b=eFW431fA+lpzjiBKgXXtPwYwseGXlpf1vPUgjRXTfZF56Z5SnZCOtpIoKsAYWc3Mfo
         HWwGcu7Z5w71585SIh1JVrIe+VHKTV/KEszbkobTFKLKCRo1z0IeTYA3Fsn5sXl1adR7
         2PfHaDIdIZ3xasnCjBuqXNAvt7wm0F+y2UzNSOyS7ggoB/AK8vNy8hHZfE7ZW/TFOwxP
         CXK891J5+XGpsUJSXEjHWc0lOH+9yzWTBa+ZMNlq/N0zCRZ9IO7IN8bVgCNVDmn7DYeW
         pjwZyDc07mmnlJs/KOpgq1byOXXvDEhyyrw1jLUjXgPXHkDBsoV8SJbzFYl15AXcpyeZ
         u1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ArY7B3RL51SioJr2VWCBecJ96XNAdUeg1sJSFJih0vA=;
        b=SxeR0F8jMqq9lrL3dY/IN6Ve3MJGfRdu/viXZJg+lTRB4jCI5qtIQtytB49KzYl/M1
         TeHdS5z3mN3JIIQ7lE0mNwFZTIFACsQ0OHI50KG5FYNhaCSHMO1CJ+waqnCLdw2Sf+tV
         r+UQ1h3pwUwCsRTN8U7F4ESUQzTUTQ1gkQ1eI6OMuvZOwR4UJNMAzcmuda/a2c0KrHli
         /oXXMVRLFjxwXYtRsYPsv8wvJXvtI3hdcz8mb/g7RYD5TCVzaPqiue45clIdDZ4Z130s
         V7Y7iZ0XNc/TStalgaQ2NxwVMHb8IY4CN/cuDYTU0Vh1PNGJH74kA5cDTge0EFTlxmTB
         cgjQ==
X-Gm-Message-State: ACrzQf1rcqwm3adwTXZWM7DXnJ8MhfM8xPilARpM+V1d9tIPv/GLkrWK
	io0TByN1ovsdNxUpgtm/G/yL95asVLq81Izz4pm1ckQ+
X-Google-Smtp-Source: AMsMyM4P4GCvdEToxujrdwjBMLXhGhhFlX686kAOm/uo5ZdT8PAk8N8hbzXZiJebu8mGbEivT1/F/vIarcfONNswpOE=
X-Received: by 2002:a17:906:db05:b0:741:5730:270e with SMTP id
 xj5-20020a170906db0500b007415730270emr16483472ejb.609.1663683981373; Tue, 20
 Sep 2022 07:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org> <20220822152741.1617527-7-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:26:09 +0100
Message-ID: <CAFEAcA_znxG6hnE=DnPCN9k4VvK2n_TzKyodNwbD2-n84TP89g@mail.gmail.com>
Subject: Re: [PATCH v2 06/66] target/arm: Use GetPhysAddrResult in get_phys_addr_pmsav5
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: svlT6jZY1hF6

On Mon, 22 Aug 2022 at 16:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
