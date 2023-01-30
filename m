Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp975530ejb;
        Mon, 30 Jan 2023 06:13:02 -0800 (PST)
X-Google-Smtp-Source: AK7set8BXg4l770+pW04rA4qQehNrWRkiDj77vavHmSWndxG5VQkkprPQnUOMe8qJp9QJidPHelE
X-Received: by 2002:a25:5b44:0:b0:81a:825d:1762 with SMTP id p65-20020a255b44000000b0081a825d1762mr2615642ybb.54.1675087982257;
        Mon, 30 Jan 2023 06:13:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675087982; cv=none;
        d=google.com; s=arc-20160816;
        b=PbUmAbFq8e5S2DyfRYKuWy//T14QqtyMt8+uz5vmoKrynrfTiqc5Nmoktze6iD5twS
         ZzeZgfftV5oxfu8IAwCnCJRghtMOkMOfpEyLXMOyQvZF1WREuQmZQa67hHnB33/AeUyL
         HymNRVIIC4GY/FR+umdGLnSE2ZiFriZlmmTn7hV9HFCtCZLug8GiPisz5Tq/a/j6gLtz
         pcdxI1+Rd+DGveMIAPCEAfxOR1QPS8BNxShCRJ5Ua3nRAnBYsXW+Pgeb7ZNjag5IEzNQ
         M9Sv7+NILKoRpLr91TMgAadI2N++T1plnDcaud1iyzs3dK+beKbMk/1rJ8yLaX1obEdz
         Q0Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:user-agent:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=/JfOpjghu1xEkXUaTMrcOhwi5M2JrjC97o13QlidUK8=;
        b=G9XqzJJQGRUycAcXAtDTmrFJJUuCMHsf+DIEw5PCZi+NHAXFH7frrnBDLJ2jkmt+ff
         u1YCxbpquFdOlPPX1VmmKraIrraNOggaxSV+sBLnMJHZwtXapItH3PzQOKUDdO1MW4pl
         f8uzQers8LvNlmq04++FAUtptSAJ9P25MDn2VyfCeg6ksHQAvpkgWuMU5oqChmMmSWui
         xT9EX7nNz/MoZBHDyAZQaAHqLI4K45OMNSdidIU6/L9JeUpPU3PR9fBwa6KZn3JD2J72
         yf1zvw2n3Uc6I5ZQnzXeEeD6Tsk9nmGMIRxKzeozeaiRxpreDuFDszNKgPY6ybW+Apik
         urJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VpMHIcQP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7-20020ae9f007000000b006fefa5ef911si6547253qkg.266.2023.01.30.06.13.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 06:13:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VpMHIcQP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMUts-0001Cs-D1; Mon, 30 Jan 2023 09:12:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMUtn-0001Bp-32
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 09:12:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMUti-0000II-Ny
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 09:12:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675087957;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/JfOpjghu1xEkXUaTMrcOhwi5M2JrjC97o13QlidUK8=;
 b=VpMHIcQPYRqWmM16iStx/GYDuNIM3FSJtabW7Ovn/WGWb6x3wSRx7GdP2SZJbtybJ+ZHas
 P0ReHBUkl3JRFv/0VsRBt9JNnAweLyFFWWK3reEBheWrOPJrglTwI9PC2aoGY4OieECSb3
 eqAjdXS5krGsLdZ8XBygSaquGwYlw/I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-494-tEnBi-klNGuiyeM2_7pOVA-1; Mon, 30 Jan 2023 09:12:36 -0500
X-MC-Unique: tEnBi-klNGuiyeM2_7pOVA-1
Received: by mail-wm1-f70.google.com with SMTP id
 h9-20020a1ccc09000000b003db1c488826so9594191wmb.3
 for <qemu-arm@nongnu.org>; Mon, 30 Jan 2023 06:12:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/JfOpjghu1xEkXUaTMrcOhwi5M2JrjC97o13QlidUK8=;
 b=d8PHiPEGBmQyg5+/7lm0+AZa6TZ7dLlsJyX9wzKiicfUlfCQrPBEFtkxI7z2fFpA83
 W2TFTpovpMVEZfSBSmvNDX0e9LBYejCb02sEhQMKZtV0Z2X6Rj86wsDNcTPBfBHgouuz
 /11tbzZQ7hyw4wvqaFwSmkFJMJ9pa80f/5fdROSogKQuWFUwxAGJo+eSaj2XlxW8xLFE
 tnXi2qtwk+1es4qcHDwLxHHtYDmZ15+wmeeQlUg1wNMXJt71yeYRp0NUq+dlEyM6BvDk
 7jkczj0T/O3bMbrbHp/7SONbkFf/4SepONr4i+kOqFMI1G68mYzWK5DyhNqn0n7KSx+e
 3Axg==
X-Gm-Message-State: AFqh2kpQar6PFFGDR5ltxMmu5IpMb1QiIj1A5rfb40kXHNJS1buD4HgY
 C6eI1l/7kM8Boe0gAddMR+T69hUnedCcf9n6bzn8TSBcMsk2uccD2Kie258zNW7J+1ccneXGSbJ
 O0L4E1CWmwyjx
X-Received: by 2002:a05:600c:1c2a:b0:3cf:d0b1:8aa1 with SMTP id
 j42-20020a05600c1c2a00b003cfd0b18aa1mr48027878wms.0.1675087955499; 
 Mon, 30 Jan 2023 06:12:35 -0800 (PST)
X-Received: by 2002:a05:600c:1c2a:b0:3cf:d0b1:8aa1 with SMTP id
 j42-20020a05600c1c2a00b003cfd0b18aa1mr48027839wms.0.1675087955281; 
 Mon, 30 Jan 2023 06:12:35 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 o25-20020a1c7519000000b003daf6e3bc2fsm24805883wmc.1.2023.01.30.06.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 06:12:34 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 imp@bsdimp.com,  kevans@freebsd.org,  berrange@redhat.com,
 groug@kaod.org,  qemu_oss@crudebyte.com,  mst@redhat.com,
 philmd@linaro.org,  peter.maydell@linaro.org,  alistair@alistair23.me,
 jasowang@redhat.com,  jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com,  tsimpson@quicinc.com,
 palmer@dabbelt.com,  bin.meng@windriver.com,  qemu-block@nongnu.org,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org
Subject: Re: [PATCH v5 04/20] scripts/clean-includes: Improve --git commit
 message
In-Reply-To: <20230130132156.1868019-5-armbru@redhat.com> (Markus Armbruster's
 message of "Mon, 30 Jan 2023 14:21:40 +0100")
References: <20230130132156.1868019-1-armbru@redhat.com>
 <20230130132156.1868019-5-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 15:12:33 +0100
Message-ID: <87sffsnmb2.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3tjc3xNp5E8n

Markus Armbruster <armbru@redhat.com> wrote:
> The script drops #include "qemu/osdep.h" from headers.  Mention it in
> the commit message it uses for --git.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  scripts/clean-includes | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/clean-includes b/scripts/clean-includes
> index f0466a6262..f9722c3aec 100755
> --- a/scripts/clean-includes
> +++ b/scripts/clean-includes
> @@ -193,8 +193,8 @@ if [ "$GIT" = "yes" ]; then
>      git commit --signoff -F - <<EOF
>  $GITSUBJ: Clean up includes
>  
> -Clean up includes so that osdep.h is included first and headers
> -which it implies are not included manually.
> +Clean up includes so that qemu/osdep.h is included first in .c, and
> +not in .h, and headers which it implies are not included manually.

I give a tree.

Clean up includes so qemu/osdep.h is never used in .h files.  It makes
sure that qemu/osdep.h is only used in .c files.  Once there, it assures
that .h files already included in qemu/osdep.h are not included a second
time on the .c file.

What do you think?
And yes, not using "include" the "include files" is .... interesting/confusing/....


Anyways, if you preffer old text or net one.

Reviewed-by: Juan Quintela <quintela@redhat.com>

