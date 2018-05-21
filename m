Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp375027wme;
        Mon, 21 May 2018 08:03:10 -0700 (PDT)
X-Received: by 2002:aca:5153:: with SMTP id f80-v6mr12356915oib.78.1526914990550;
        Mon, 21 May 2018 08:03:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526914990; cv=none;
        d=google.com; s=arc-20160816;
        b=DPl7MU725iauInbVUtqp/YMENdfJO56a24Sa24oos6OYz/yu6yuMtLrF48rLmF28B8
         NoTnyO8ybUpOFVGbIN6QBfcFc8eoKtViBd+hzUC96jpLxDrAy0T9m//ErFl9KrC28mg/
         cbzCF2A2t8g595HnUK4uW5F6Zgx1jjaF3q+Yse4o01faXiFk4PF/D0tnNIaauO5jlbHp
         0ZAMzHESkVv/VbYDXx7CICc9d/xXFqiUaAVOzZsoMj6Ob7TBNsueugNqOyfOftMbin+0
         c2oO2gHPZj5fJz9LqfQJfF3+8SPDow8py1nXBRGItP9w+Y6wp0DkOdN2VtGdbF+QGIM/
         UA2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=I5sn7q9AZU6s9FrH7GJzs+EfK73W2bh3GGxnMWfNMtw=;
        b=r+e1rEiUMTeps/0D6hMBPoGUsktY/7JceARfDGEsKuadgZ1KjlVAsQXcweHaOKKc6F
         v6ma4Fe5ZFfXcYeq8bLlQK2LBVYDXRLFrh6dX/VnKXf05dNyqOycH6SoeT8pr5B11+uy
         sJrLYa2ou4f6F9wm9AnikHXnI09znAaE1HXig9aJrk+fXLP9cF2fJ1CcQRv8T/NHyMdd
         rqj8pljJtQWX4ZidxVvog3G+ZX2lBUv6XBrADsBtX9mXTRZ+ePjWRDWbr/h2hEs04FZ/
         JvbaNmf35BnVc9AV+FOyXgY52Utlgg6OcazNl70qLmmzbXSZBT6q6O2h/tdGIYI8/DGS
         Hufw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oa221/WZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w20-v6sor6932231oiw.248.2018.05.21.08.03.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 21 May 2018 08:03:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oa221/WZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=I5sn7q9AZU6s9FrH7GJzs+EfK73W2bh3GGxnMWfNMtw=;
        b=Oa221/WZ6L/cNQFdhIpvYAOs+m+2fEAPRNaXYtrccxbmukUBgTARphimQcoU5l4WR7
         QEDr9GFUDeO5ZvQlqhvAMEhGKA0csPXIIWwgGPGu3rY6ekcBmdDc2HeGQc07eTg7FodU
         ub7UuouvDItS5Vfr6PFn7f9EdAOLmE7vsO7yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=I5sn7q9AZU6s9FrH7GJzs+EfK73W2bh3GGxnMWfNMtw=;
        b=ZqDdwT1wHZn17hW79x4382UHcBMWEfl2kO89LfSG2nkCigSDKyV388iiJ0WKxW6tnC
         jEFpoZoeZ6O0kYjNP3ZvshV47DD5phD8v7DsX75ZQpVBRbRN6U6oP5LJ2YvURhH7n+cN
         EnI6qiM1dO66LkH4j5NLB8NotSrTIuu3XqheH8W4I1euoI8vXywG8uWe2/6cvDMocqfn
         tWrn/rMtuGArviAgo3Hv6nYNqbl3B1GTWsj5HqvPAPwagBDOHwDxhpOTHNSD2Q4C/YIn
         3PqnNt8UalgjC194PAH7qex0uVuJXuenhN+ZA2O94kveUjqc8HdYMl1JkmxixiRR4UC9
         TfZg==
X-Gm-Message-State: ALKqPweANuJc3l7QJMKLy2EksxovzS/xR9ErBRASiTKdjssb19VhSlkx
	H8QAdkKy4b0MMYU5KLeeJ9wIGoswUj7CFaV27sGdtJwa
X-Google-Smtp-Source: AB8JxZqFSefmeSmAnRD1IlXtldINsOZs6EqIBIBTlK9F6LsRVSlnBqo3niP01HhzwTj505YabBt5Y9X2h7/bMkZ+kQQ=
X-Received: by 2002:aca:cd0b:: with SMTP id d11-v6mr11172876oig.337.1526914990231;
 Mon, 21 May 2018 08:03:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Mon, 21 May 2018 08:02:49
 -0700 (PDT)
In-Reply-To: <c049f864-304d-f8ee-4b2f-1476a602be30@redhat.com>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-24-peter.maydell@linaro.org> <c049f864-304d-f8ee-4b2f-1476a602be30@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 May 2018 16:02:49 +0100
Message-ID: <CAFEAcA_ErfYKnVrp=Dv9mNg55Y+=fFmg4eEMddGdMxUGVb9ztA@mail.gmail.com>
Subject: Re: [PATCH 23/27] hw/core/or-irq: Support more than 16 inputs to an
 OR gate
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Richard Henderson <rth@twiddle.net>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: RE3rhUFE5UmN

On 21 May 2018 at 15:34, Paolo Bonzini <pbonzini@redhat.com> wrote:
> Why do the levels have to be migrated at all?  It should be enough if
> the IRQ level is either migrated manually, or restored (e.g. in
> post_save callbacks) through other data that is migrated.

This is standard behaviour for devices: they track their
inbound irq/gpio lines, and then that becomes internal state for
them that must be migrated.

If we didn't migrate the input line state, then after a migration
the levels[] array would be all zeroes, and the next time a
connected device signalled a high-to-low transition we'd take
the output line low even if it should not be (because we'd have
forgotten that some other input lines were high).

In a different world, the state would be in the qemu_irq line itself
(in the same way that in hardware signal lines are their own state),
but we can't get there from here.

thanks
-- PMM
