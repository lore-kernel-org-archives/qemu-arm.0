Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1185781ejb;
        Thu, 30 Mar 2023 04:59:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350a2mrzHTqzrZiD3trlK+GifRr+mJHB9c7PyPTYHI/Ec/etJO6ZDsG3dzTKDpGC/oOl5dura
X-Received: by 2002:a05:622a:112:b0:3e4:e5bf:a24d with SMTP id u18-20020a05622a011200b003e4e5bfa24dmr26516146qtw.11.1680177556026;
        Thu, 30 Mar 2023 04:59:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680177556; cv=none;
        d=google.com; s=arc-20160816;
        b=VoQBKv3bSmbsznNSVGPHbpuGdUrrmigpw8C/4+SRNWoDSKqg9nQ0ozB9EBoR5Q/rxA
         BI6l7S7ypjJFDBQBiUHJ/cdEadaBpMU7Nbf5kQcXtta4F/Dox7UEtomhRi9s/SbZJ1y6
         96BJ7V6Z2Nms4qWOz6BIxqwnkLXIzgnw1GJtNFVz/EiBoCo5sIIAHjErT8jh+sgCCn6w
         iNFleL/XP6LGmr3n62LF8lDuTOETr91oBre2EPhWe14dDVZb4LP43jHoLGpJZksbUzlQ
         JL5kzSp5Em97JkUjdoNVxPv3MQtWLKC9CbZDdLqhHW4ouSXvnCoOUEsTX4wuTZHBXj1G
         volA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature:ironport-hdrordr:ironport-data;
        bh=MGSsQrurj36w9LLG/vqOxxOQCJUayI+JCrLzJXYBM4A=;
        b=BNu9Xt0GS/AAVUmFtAjBH95eJ5nFxbVqrOeeq38AWVEfxCutp2AgQEPsjSlHHWTy1W
         UxSFgEkC3RG6/RlpVvpszmB5aB6d0f14IBnPmo4KgJzMfHisA6617kcZ4bjmE6++3T60
         YYAVn7RlCn6Zbqap7C3a1r+PjrEvAvIFvOYAzT+8nTSX9UyeEQbNjxp2X6RAnncgdk7K
         yNlAl0OlDx+UOwUrqRQxZtrJfFDpMyftCTd11VH3hPQvX+OGiJUqJi6Ui52e1v+m/whw
         ljlHyaqDjemxl1yfxAiI/i6wpwXGV2vNlThGiLJya12GpCYUKz8aSyQCBwzL7K513fN4
         CbWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bu.edu header.s=s1gsbu header.b=dZFpRKbY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=bu.edu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o7-20020ac87c47000000b003e4f30993f2si4462103qtv.653.2023.03.30.04.59.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Mar 2023 04:59:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bu.edu header.s=s1gsbu header.b=dZFpRKbY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=bu.edu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1phqvT-0007Cw-Mv; Thu, 30 Mar 2023 07:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1phqvS-0007Ci-MW
 for qemu-arm@nongnu.org; Thu, 30 Mar 2023 07:58:42 -0400
Received: from esa9.hc2706-39.iphmx.com ([216.71.140.197])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1phqvR-0004YJ-1d
 for qemu-arm@nongnu.org; Thu, 30 Mar 2023 07:58:42 -0400
X-IronPort-RemoteIP: 209.85.219.71
X-IronPort-MID: 269785177
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:qjCDyqDIfU8TARVW/5rhw5YqxClBgxIJ4kV8jS/XYbTApD8n02MGy
 GcXWmvXPvyDZWWned4kbtvi/UhQ7J+HzoAxTANkpHpgcSl2pJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH2dOCn9SImvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0i1aYDkpOs/jY8Eg05Kyr0N8llgdWic5j7Qe2e0Y9Ucp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VTKlLgFVHmZkl+AsBOtiN/Shkaic7XAha9hXB/0F1ll/gpo
 DlEWAfZpQ0BZ8Ugk8xEO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFOr2tlnDXo8E7E+2eZNEU1U1
 b8BeQs0O0Xra+KemNpXS8Fpj8UnadD1ZcYR5SgmwjbeAvIrB5vERs0m5/cChGZ21p0IR6+PI
 ZVAAdZsRE2ojxlnM1MHDp4ktO21wHTzblW0rXrP+/toszWKk1MZPL7FOd/NfYWPSstvgF+in
 EjF1HXFLyozHYnKodaC2jf27gPVpgviVYcPUbSi89Zsh1ucwHFVDwcZPWZXutG8g0+6HstBc
 gkapXNooq81+0imCNL6WnVUvUK5g/LVYPIIe8VS1e1H4vO8D9qxboTccgN8VQ==
IronPort-HdrOrdr: A9a23:MipvPa0RzcN5asSTECL6/QqjBLYkLtp133Aq2lEZdPU1SL36qy
 nKpp9w6faaslcssR0b9exoQZPwJk80lqQU3WByB8bFYOCOggLBEGgF1+XfKlbbdhEWmNQz6U
 9qG5IObeEYB2IK6foSmDPIceod/A==
Received: from mail-qv1-f71.google.com ([209.85.219.71])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2023 07:58:35 -0400
Received: by mail-qv1-f71.google.com with SMTP id
 f8-20020a0cbec8000000b005b14a30945cso8095374qvj.8
 for <qemu-arm@nongnu.org>; Thu, 30 Mar 2023 04:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1680177515;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MGSsQrurj36w9LLG/vqOxxOQCJUayI+JCrLzJXYBM4A=;
 b=dZFpRKbYBG/KyARr4wEIliJ0u/9P6PMBg4MmKfaB3oMpKRrCfSZOQcRoDcEVNLJPJ6
 hafwEJUpxVzp0Cb+hmsux0ro4VZvrfTsOT5ocrjvhdjj7GS44AoXNv7aEsDcB74y6VIX
 ZRctq8rns0wS3/nAl1jl/EHj3clcaaowN3OOyCawTQ0OXQ5DzeZEuDCpvGEUXXhaQ3II
 10ruSohfnDPOmxHn7drAZ+grDcqzYVoVNoc5csTJlYd2aM8XQxdD3Ma+Tz/aI/nA5wpN
 Vdz6Js7wDH9NM8Rvz8XM4pjvGg/Mu4eYVd/8FwI0ql2UvNDse9W+nUkhAxeva9igUeOC
 Kpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680177515;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MGSsQrurj36w9LLG/vqOxxOQCJUayI+JCrLzJXYBM4A=;
 b=hP4mp1T9WP6cHS2hHx9loqFFQ8hAIm2aU0stk3eCz+yfqnRSuoGzWAH9ZuG7pCdPTa
 inbN+OjfSD7NWHFhuXQOXpBr5rj7n8o2G1uVgXEvk83PFexGliLNTroNhiG1b0e+g2OP
 1S/f94FhfdMDLKVZ5eX8lNzuiN20pCTKu7N4vZZadsC/UOrwusZYs1C5CAuS5wH/VQC+
 wgTJhU3TpETXapGd/cypq7KXCn0UoOrCYtU0rB6e2pg28C7Z15Ae0TdRb9ohNGSAKsfp
 JmKwVH3ZVFfo+nbywvdrlSa7/d5DRKt3ONM1OF9/7nnGg17Jw7f91hX4IatVrFj+2k7d
 edtg==
X-Gm-Message-State: AAQBX9d9/w9O9ndEJVLloCCnLsRwN/S+yBO3J4wL5ywak+CztwY26Dk2
 I5KBwGLA8iEg3RFm6mWuZp55ZiOzc4W4IZljkVVmGr4jUjjXt5/fX/9gQ+b8mxW7qLa/pPLg35r
 qQo5UpPDZzQuvKio0boZbwchCTEU=
X-Received: by 2002:a05:6214:230d:b0:56e:afe2:ebca with SMTP id
 gc13-20020a056214230d00b0056eafe2ebcamr39329953qvb.30.1680177515225; 
 Thu, 30 Mar 2023 04:58:35 -0700 (PDT)
X-Received: by 2002:a05:6214:230d:b0:56e:afe2:ebca with SMTP id
 gc13-20020a056214230d00b0056eafe2ebcamr39329936qvb.30.1680177514978; 
 Thu, 30 Mar 2023 04:58:34 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 ny15-20020a056214398f00b005df51f70956sm1295469qvb.22.2023.03.30.04.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 04:58:34 -0700 (PDT)
Date: Thu, 30 Mar 2023 07:58:30 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3] hw/arm: do not free machine->fdt in arm_load_dtb()
Message-ID: <20230330115830.gj5ntltek3auh4sz@mozz.bu.edu>
References: <20230328165935.1512846-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328165935.1512846-1-armbru@redhat.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.197; envelope-from=alxndr@bu.edu;
 helo=esa9.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: q3PzPM5dQd1B

On 230328 1859, Markus Armbruster wrote:
> At this moment, arm_load_dtb() can free machine->fdt when
> binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
> retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
> the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
> machine->fdt. And, in that case, the existing g_free(fdt) at the end of
> arm_load_dtb() will make machine->fdt point to an invalid memory region.
> 
> Since monitor command 'dumpdtb' was introduced a couple of releases
> ago, running it with any ARM machine that uses arm_load_dtb() will
> crash QEMU.
> 
> Let's enable all arm_load_dtb() callers to use dumpdtb properly. Instead
> of freeing 'fdt', assign it back to ms->fdt.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Fixes: bf353ad55590f ("qmp/hmp, device_tree.c: introduce dumpdtb")
> Reported-by: Markus Armbruster <armbru@redhat.com>i
                                                    ^ Seems like a typo

                                                    -Alex
