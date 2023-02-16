Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp516483ejb;
        Thu, 16 Feb 2023 05:58:42 -0800 (PST)
X-Google-Smtp-Source: AK7set810EnX1t3DCpQdWUr3qzd5pSjTLGAQalNkRLP9JQeV5R7YWXT3u8GgdiD/KAhHOZtUIWFQ
X-Received: by 2002:a05:622a:1987:b0:3bd:1e3:d034 with SMTP id u7-20020a05622a198700b003bd01e3d034mr8550515qtc.38.1676555921993;
        Thu, 16 Feb 2023 05:58:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676555921; cv=none;
        d=google.com; s=arc-20160816;
        b=NGBbO6GhPt7/9TdiZSUw47szpltBzG9aCWkJGduMqY6PkNbv2YzW0Vo224o1J1PN5C
         fVH6yCIaUMO6HSbxp6oTm346V6ln3AN4Ikl85ZUPLpDHm8KDrx/6yFb3SnY7PSivZB5Y
         GIvCZ4pmgkXkbIij5sMgniymwjfxRqzY913FoOvVRsBB+yQHKUNolp9d35Fpq8NL5yup
         qesoyciDhcUk8295hyWYK4tJLfZhh4KK39m40ZL3y7TDzsL43a4D7NGLwC7RaMuFmqTj
         Xr9EGWLoiLYLq2nric9AfAIn7w1L+V+fJUEcmNuQOdlI7WUJ2eL+2MmgCpMuTSrk35PB
         C4LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=oOAF7Avv2m9okX26X1QQQBtkLpOUimdEi6kyPJqmGCU=;
        b=osLw+210UkD5oX71JLxB4XOgu/Ul9Zw0i7CgyQPIT4Htf9u4w0rCaxahis8T29GzPp
         Ocp6g9kik8nUo2ZggRUZBheuNvBjY11pq+uUMcGVdGThQNX2PmLp79CQumuWxKP5t8wj
         THgL9u6jVmRbFUo9GCgqkZvK7c8k6qLyn9gr0ML9A6YbYpI668b+wzQBt80v8xJWaTXv
         fFOsirM/6ybIhX6cXPJY6SsO0C6GmUv8H1QN4XJKhOJQxIq05ozhmxalF/As+xwQiIXt
         raUyGOTazhf2oN4dCXk0w3vj7IgogJkpRVWu1jnCmKewxKw1UK72PwyWkyeqCcfiNNwJ
         zViw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=X8MUJWZE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4-20020ac85b84000000b003bbd8bdb938si1626838qta.796.2023.02.16.05.58.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 05:58:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=X8MUJWZE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSemN-0002ri-UB; Thu, 16 Feb 2023 08:58:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSemK-0002rH-PX
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:58:30 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSemI-0007rY-2X
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:58:27 -0500
Received: by mail-wm1-x335.google.com with SMTP id he5so1627238wmb.3
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oOAF7Avv2m9okX26X1QQQBtkLpOUimdEi6kyPJqmGCU=;
 b=X8MUJWZE2HfktSgCL9+5gLsAMlD+Rs5Giu6vq+nuG5yGiNTlPEVkMMR+ZufVG5ls9+
 +MujOMgT5HDyyWum3M+qOo0WYsV5aogNhapTj53CeOBS511Xkef1PvtIdUtdvDdQAiFo
 WhMV8lP6wCh2aefvvbbIGH6teSFBiIeX6XJOl842WrAM/s9wOJSaEAornDfQ8TEnylRm
 LVcFwa+CVpW8Bd6lXvMs12qA3C5b0gjeeW+3hCP/fvGkc8e2lCRClL/JvC59sua6xiXP
 TOQm3ai4oLn5oEBhI01oIiGZ+uo2b/PAdA3hp/G2YjqB7T0ysi8zgVcMMMvA+0NJm6Wz
 7zOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oOAF7Avv2m9okX26X1QQQBtkLpOUimdEi6kyPJqmGCU=;
 b=XISVWUNXjkVpW+dM5/UzR2oMjlV1rA76GPgHtyH3xB2E69n3DSsqPUHDNl99ABkpyF
 eHkAaNfjgEdtwvV2brN4Q8P/TfRGrGBGqJro2Av3TjiYXUuzcKCERQkEUm641dpJlZb6
 jrRIh1KvQUtRa56OiJ/aR+aqU+Igyk34cYMH5h6qoyLAMMJ9pg8zxjb/krtaqCI96XUT
 UpygwkzS+VO/n/akKl6nok9fij8JKVZ9JXiEEMUHgnOJjAbR2Mb6tqjLOpU5sUgtbS9f
 MRc/A+CNbIx7Ase4DLDWa0jKnmbAanDO+xIak2om+MrKYBQvMEsiD/7GQeraQ4E9Pw96
 RDPQ==
X-Gm-Message-State: AO0yUKWBptLgIf6v5d3GUMDvsst2Gmt9nyQOQieb2VvFfnPg894UxD8P
 qv7kj8oADOmTWt/Hld0tde8AlQ==
X-Received: by 2002:a05:600c:3b1b:b0:3df:f3cb:e8ce with SMTP id
 m27-20020a05600c3b1b00b003dff3cbe8cemr174948wms.7.1676555904026; 
 Thu, 16 Feb 2023 05:58:24 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 s10-20020a7bc38a000000b003dc1a525f22sm1779037wmj.25.2023.02.16.05.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:58:23 -0800 (PST)
Date: Thu, 16 Feb 2023 13:58:19 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 13/16] hw/arm/smmuv3: Add CMDs related to stage 2
Message-ID: <Y+42e9PE9g7JpBuq@google.com>
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-14-smostafa@google.com>
 <7ebe5091-54ae-d5a2-09c4-0ae1e8276cb8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ebe5091-54ae-d5a2-09c4-0ae1e8276cb8@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=smostafa@google.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bb5709rKMX7e

Hi Eric,

On Thu, Feb 16, 2023 at 12:56:52PM +0100, Eric Auger wrote:
> > @@ -1174,14 +1174,35 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
> >          case SMMU_CMD_TLBI_NH_VA:
> >              smmuv3_s1_range_inval(bs, &cmd);
> >              break;
> > +        case SMMU_CMD_TLBI_S12_VMALL:
> > +            uint16_t vmid = CMD_VMID(&cmd);
> > +
> > +            if (!STAGE2_SUPPORTED(s->features)) {
> if you add such checks for S2, may you should consider adding similar
> ones for existing S1?
Yes, I will go through the other commands and do the same for stage-1
only commands.

> > +            smmu_inv_notifiers_all(&s->smmu_state);
> > +            smmu_iotlb_inv_vmid(bs, vmid);
> > +            break;
> > +        case SMMU_CMD_TLBI_S2_IPA:
> > +            if (!STAGE2_SUPPORTED(s->features)) {
> > +                cmd_error = SMMU_CERROR_ILL;
> > +                break;
> > +            }
> > +            /*
> > +             * As currently only either s1 or s2 are supported
> > +             * we can reuse same function for s2.
> > +             */
> > +            smmuv3_s1_range_inval(bs, &cmd);
> Shouldn't we rename the function then?
I guess we can rename it smmuv3_s1_s2_range_inval, we will have to
revisit this when nesting is supported.

Thanks,
Mostafa
