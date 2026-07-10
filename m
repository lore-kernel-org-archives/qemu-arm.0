Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39CCC44501
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 14:52:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiCaj-0004Dx-37; Fri, 10 Jul 2026 10:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yisooan.dev@gmail.com>)
 id 1wiCah-0004De-NM
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 10:52:35 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yisooan.dev@gmail.com>)
 id 1wiCag-0007cE-DV
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 10:52:35 -0400
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-491f5e6d564so529083b6e.1
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 07:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783695153; x=1784299953;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6K3++yYqtMVz+66TdVWG0CLOVt7auPHDlu9IMlBdkQk=;
 b=cH7b9oGgG4GI0/TketmMF5Rzy29fHHmqTs1YioqubMQuDuwfi8daIWhqsS3wWPDkOr
 iY9M4dv7hU7w6WEqtrhsqCr3pp3Zt5YZEe4BroniSprbPlyKKvVQjY/ZHcFV++IyBZER
 ISaKWG/NcJgng2/uSaCt1aK1y5c0dFw6qUh1HOxNOWVxtbOrDBMFs/Cxl6XVNxBiZCWA
 9Aq82iwdwpQ1PtSwfseG74feH1scYfWXnCL6qmIheRW83jxgmKURXJZwiIAHQINfL2Fe
 HpKP38DUMwmjqOJnQ27j9lQoUnvyN6uNx/52mpK1TxSSOK0ukATFUBJz6rBSevTz/RqN
 POrw==
X-Forwarded-Encrypted: i=1;
 AFNElJ91CDLwmblKs5/n9DKp2pgfY1eFsxNeuVPMykArNPBuxWgBKUpZ3cqN68JIbAOjqxLL0+aVj710bg==@nongnu.org
X-Gm-Message-State: AOJu0YwCdj2MOvNriMXDyOn6AVLBVB3VXC79gqK/GzIcDejOl44x23hj
 9wz9sxGI6mOBFmHMj1kdHiaRwdBxfQFRPVLWMJtSmnipZpbb9knCKF9cwjWjsR/iPNs=
X-Gm-Gg: AfdE7clu5Tr1QU7brCrB9rhyuXfBYy4IAgzW10ghYGo5raph1hipnHNvODcyutnOLIl
 sHFN5I5Xh/NgRRDxpp+94qGDvcNjtyd0I3czLk0jSrWsj7xf0RYfRLMAt6nPw8Q4Af4j0tS4iA1
 0tkkchVuSBwIWqDUBNU1eQeXLepVJA1NUzz6PrkeNhK6bs7I0pC8iQcKp8FXv5ivdABhXzXiYDa
 earRNfiqlGzhMbfwV/R2eyDGBSYEnc5DTzrpP5PvOJoJMkAVxdXhR/oZd+GRj7OY+SCV4Xyizt8
 jXfOAZ/5XYkU8aWenvU7E4Lsy1zjrLuRz/w4SxJ+0yW6YDWIcg5bORbdennjMFhIfjldiJwMF+3
 uwLR8UZt+gmw1hNu1QtLgh7p/gwpicCH9fqfpYJj8yGiUXWySqs3NWXlbeLmwholdN4URHf3Ebf
 7Y1mx3k2zQvyTCK1R9lOpeqv0TMsUEN7N6VrOE72S7DbW0Dwza
X-Received: by 2002:a05:6808:2205:b0:495:4a22:f29e with SMTP id
 5614622812f47-4a203dbfd0dmr8434026b6e.25.1783695152412; 
 Fri, 10 Jul 2026 07:52:32 -0700 (PDT)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com.
 [209.85.167.174]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-4a1afde6cffsm6341127b6e.11.2026.07.10.07.52.32
 for <qemu-arm@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 07:52:32 -0700 (PDT)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-4a427e628a9so47791b6e.0
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 07:52:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ/NoKiftajtyx19g/7wr6oXIWzByQ31n6pGYvoTsyz/hodZHXZytFMNNjwYpexY9uLwdPmv0AB17g==@nongnu.org
X-Received: by 2002:a05:6808:c3f4:b0:496:11f1:f2b5 with SMTP id
 5614622812f47-4a202007753mr9756848b6e.10.1783695150115; Fri, 10 Jul 2026
 07:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260623-guest-panic-unhandle-v1-1-6adfb6d4221e@ooseel.net>
In-Reply-To: <20260623-guest-panic-unhandle-v1-1-6adfb6d4221e@ooseel.net>
From: Leesoo Ahn <lsahn@ooseel.net>
Date: Fri, 10 Jul 2026 23:52:18 +0900
X-Gmail-Original-Message-ID: <CANTT7qiAidmrEPD=S7F4s_JNvFYL4cY=CWLbbfuJgOM0syqMbQ@mail.gmail.com>
X-Gm-Features: AUfX_mwSWH_Sd1f0Xuv3kZHDs_waThqZKSdJLzxJdpePxRaV9PhpOQLdXVn6g3U
Message-ID: <CANTT7qiAidmrEPD=S7F4s_JNvFYL4cY=CWLbbfuJgOM0syqMbQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm/hvf: panic the guest if an unhandled exception
 occurs
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.179;
 envelope-from=yisooan.dev@gmail.com; helo=mail-oi1-f179.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

ping

2026=EB=85=84 6=EC=9B=94 23=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 9:56, L=
eesoo Ahn <lsahn@ooseel.net>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> It's worth cleaning up all resources that the guest taking and to quit
> if an exception in el1 could not be resolved.
>
> Otherwise, the guest will get in the infinite black-hole by
> unmodified pc.
>
> Signed-off-by: Leesoo Ahn <lsahn@ooseel.net>
> ---
>  target/arm/hvf/hvf.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 8b902c6882..4358cf90e8 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -2533,6 +2533,7 @@ static int hvf_handle_exception(CPUState *cpu, hv_v=
cpu_exit_exception_t *excp)
>          cpu_synchronize_state(cpu);
>          trace_hvf_exit(syndrome, ec, env->pc);
>          error_report("0x%llx: unhandled exception ec=3D0x%x", env->pc, e=
c);
> +        qemu_system_guest_panicked(cpu_get_crash_info(cpu));
>      }
>
>      /* flush any changed cpu state back to HVF */
>
> ---
> base-commit: b83371668192a705b878e909c5ae9c1233cbd5fb
> change-id: 20260623-guest-panic-unhandle-4921d2aa69fb
>
> Best regards,
> --
> Leesoo Ahn <lsahn@ooseel.net>
>

