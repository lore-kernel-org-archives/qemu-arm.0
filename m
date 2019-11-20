Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1819898lfc;
        Wed, 20 Nov 2019 02:51:12 -0800 (PST)
X-Received: by 2002:aca:6006:: with SMTP id u6mr2214019oib.137.1574247071933;
        Wed, 20 Nov 2019 02:51:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574247071; cv=none;
        d=google.com; s=arc-20160816;
        b=quaOsI7M2disgsECFwX/jaiwvLJfhzjP3zw8WItJM4u4AmMbWkzoZGF4q3JS6qMWHY
         aOUhcRtE2sChcLAAROk22FftTtEA2DYJpjRNOSzfLfohyhXQYN+V4oxuG8nZ1ofLBOYg
         molLBRN89TI5doxVizKD1qIBIvQRVDwEUz6unNKJAVo0zJwVBRh7txh4xd/LtNtyAWZn
         //KZ/pPzvOuk7Xp8W2oc5uVay66MtqzjrPTxqBONX1NFVL8bNmxqWr4CbgaQnUd6Yigv
         XOfCcs7ztZGoie0ifmYNAf+e9TS4JyTYRXT+lFkcm7226uesOOoCz6KXChkwNn2hdzRf
         L8Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aal/ea6Sj9JcKtUdRuLSDnLxR0Gv/3zrPtNSuuc1hG0=;
        b=aCrPst0q4azDiKSTHJ3i3I2TXGfhiK1Fc1Ovw+eqlw61XyCFxGgZNX3U2d5USKGiv0
         ldx9AaEK2sZUTeCjf5m1z31bwaeIDMGEhHsftRoRK6QVu3fwh2Zph7M2Dd9HSTttCu49
         I4Tx2/lan7/LDhELrrr1Ifwggz7yZkrjEpPbKUuTgpJ5uabyDTuxlXnbdYN8fAR6g2l9
         J+2NSdPTvKDhbCgbrW8lSxnIQyZKbBJrXh/yWzlqtgv0o6QGmFsI9eB6+236kBA9U+0Q
         xwxVinniRf9HqctYafI3QsjGzMDg1+W6LpUwOiA+WIsTpwSUYeDnWhNNAwAnZ+gw0Eu7
         QBhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FKhJPGk5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s127sor13798491oib.91.2019.11.20.02.51.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 20 Nov 2019 02:51:11 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FKhJPGk5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aal/ea6Sj9JcKtUdRuLSDnLxR0Gv/3zrPtNSuuc1hG0=;
        b=FKhJPGk5E7XI+A0j2tWIauXRiitLVMqxGCcz8X1UzDfHXfpM3quXBtlsKWaMxe5HTz
         PBDkcrPwpci26gCYA1VJJmkFiPsaDGzps5Um6yqiHulOKFBbbKUoG/recepJkZ6StTb1
         q0icwuGQDaU5sRHJXDIEhYLRe0u+0Brco1ME6kf8wGJHM1a4H5+g2h7rtkdSJwzQGDlj
         aY/9rZOScLGBY9taDJpuiy2peNXmayy2s68ex3ZPvUkptZwKlHb3XyysyNkfo/OTkbC+
         eb6U1lF3FY88iSay6iT8uD/ZHe/5w4ZcFYC/DxjaIUqSpA6hHR66JNUiUYTH9Jtn7hpP
         83Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aal/ea6Sj9JcKtUdRuLSDnLxR0Gv/3zrPtNSuuc1hG0=;
        b=ezovybBX6ptTwWfYnlWld1O0RrgyrcWQOuMbk+7Z6Zv4o/UD3r9fqBap6UuIb1xJfE
         yeqSTZvFWDYJGcJ01v5OFHu9348XC4JadExA+JMUHJd5MrNob8BmwrKUVr3MDBF/vOOa
         wuJvFRyCUoSlKrpCkPW6P6QxXTdYMfsOGukBarte6lBBSh2EQaE2RckrD8dr47K++hLy
         hSZmN7vxcfciGSo1GrYnGACym+dxQJ/bCIpMq5jaXs8+0kQnfVUAdxf3/K6PtSE9bne7
         NiafknzZ+rRvArmTLvW0XJAcp/EJjRED/iaqA5UbDS3qlPGhehgAA2VAMevIEx41tGcT
         tPZg==
X-Gm-Message-State: APjAAAViYv0IEsM4JkX1kwjDzXYtCzLy6TKAHZZHlHxu1KpGTLcv8ZzB
	H/8s9iECnPwEpHLuDCPw9AbZf3Do6qlceUYWBPdQZDak
X-Google-Smtp-Source: APXvYqxQ0LOnPnMOlPNRo2pORqJlVhyrdeK+DIEjZdbmxM0JJtafzsA//rQk25cAUOV3ji1nmZOCI02JKdJKQyflC0w=
X-Received: by 2002:aca:cf12:: with SMTP id f18mr2135547oig.48.1574247071497;
 Wed, 20 Nov 2019 02:51:11 -0800 (PST)
MIME-Version: 1.0
References: <20191120091014.16883-1-thuth@redhat.com> <20191120091014.16883-2-thuth@redhat.com>
In-Reply-To: <20191120091014.16883-2-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Nov 2019 10:51:00 +0000
Message-ID: <CAFEAcA_OpH_4rzpVN=v-HNadQm_Mh6yGBReKP4C_wic1ETq6kw@mail.gmail.com>
Subject: Re: [PATCH for-5.0 1/4] hw/arm/nseries: Replace the bluetooth chardev
 with a "null" chardev
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Libvirt <libvir-list@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: KBavsy3X568y

On Wed, 20 Nov 2019 at 09:10, Thomas Huth <thuth@redhat.com> wrote:
>
> We are going to remove the bitrotten bluetooth backend, so we can
> not use it in the n800 and n810 machines anymore. Replace the chardev
> here with a "null" chardev and stop including the "hw/bt.h" header.
>
> I am not aware of a full working N8x0 environment that can be used to
> test these machines, but the Linux kernel from the Meego project that
> can be found on http://stskeeps.subnetmask.net/meego-n8x0/ still seems
> to boot as far as it did before.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
