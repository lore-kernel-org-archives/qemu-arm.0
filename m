Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp5098153lfi;
        Tue, 7 Apr 2020 04:32:43 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ/uL0k2emOxA2dGSzPP7xmLbjiwGFo5y61sfnX8/Zy4U0aWLV0NbxdOKqaFCmaEHNttEXJ
X-Received: by 2002:a0c:b4aa:: with SMTP id c42mr1644422qve.188.1586259163356;
        Tue, 07 Apr 2020 04:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586259163; cv=none;
        d=google.com; s=arc-20160816;
        b=BYXtBb9ALhJ2TpwP/kxC3LVOtZ7jO54uENXau8Z8cIi+fpjCZq1vXf5RUN+tQEZPQP
         OBRr2XqVolGJ+HoJR6Yvqx4WopYtkj6dm/MFep46lfaSkV5eDRhWH4o43v5YJ3RYcKyL
         bFudoXzf4BNxqA270GMTlnxgFWAO0pLdMlLGANMTpO8HAUkATCx/WGcoykEofG+GjeTj
         w1KNYhsJJe+2LPhWq/uLPuQ7H5WtATxygOiWdcr27dnoJaz6ZcKwYNEZYSdDWgFSDpYY
         cSnyrXOq5a5wo3uKrQpCXVhLqNaQGWwXTKIJLN1mUnktSNr0COJfaOQ9LfSEXfjgBT4s
         jo9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=JuAadKhJVGNMS30qk4UB/5cMlBCt0mxjPjTQTv7VmaU=;
        b=eodEy96OFXIHqJ13qR4PWFs6ka9HL+4xbLVe6j2EOgQpQPFzVFvnhbcRJ0P2BGBTHp
         eU8EMhTuBzNI7aJE71pFGJv5weJ1awr6yD+w1vPAYiPYOEYIT8QRnqrmZOp5HiesZKAQ
         CKIb78Tj6lEsA9MuggChsX5tfxt6pfCAMN8JjNzN2zJl+4mmYDP50Xq3AXi+pdN9BDkT
         T4IEGtDbUjw5HiKqPWpM0ikVfWuF0oPvse8xnCvunUPd6apZmLD3+23M1BEHOPpfSEjk
         ZPtcXr6gWIiJ2eALaPcJf2ckQTYKiY9wp9GiZmdfeg5TIMFm9xCiLY4pffTnA5hw211u
         S8hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=iQ6c8ZHW;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id m19si1551021qtn.327.2020.04.07.04.32.43;
        Tue, 07 Apr 2020 04:32:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=iQ6c8ZHW;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id DE3794B0E9;
	Tue,  7 Apr 2020 07:32:42 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.91
X-Spam-Level: 
X-Spam-Status: No, score=0.91 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699, HTML_MESSAGE=0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HlFqeAsarUVo; Tue,  7 Apr 2020 07:32:41 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id C88CF4B0FB;
	Tue,  7 Apr 2020 07:32:41 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id AC6D24B0F6
 for <kvmarm@lists.cs.columbia.edu>; Tue,  7 Apr 2020 07:32:40 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i3NN4mpu5nOr for <kvmarm@lists.cs.columbia.edu>;
 Tue,  7 Apr 2020 07:32:39 -0400 (EDT)
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id A60674B0E9
 for <kvmarm@lists.cs.columbia.edu>; Tue,  7 Apr 2020 07:32:39 -0400 (EDT)
Received: by mail-il1-f196.google.com with SMTP id t11so2840643ils.1
 for <kvmarm@lists.cs.columbia.edu>; Tue, 07 Apr 2020 04:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ig2mq+AH5o0UP+b5KHhG9X0qqULQtiCnJDgxb4T5GVk=;
 b=iQ6c8ZHWKobiDdIZ3BcuUVM0Xewv31lvkznxohyjVKNlwXhELtKc0lVBLTq+EkrGvX
 0PneZH0rNVtsHE9O/beClqQx0aSDvFy8T8+/Lnb3xQy3P4YtyOtfaEBCCzMB29yCUH76
 3VJflY4XMe13gSIYOlwt8gmsbZFAGgOn+p9Cif2RL5HPVbG4K1nQ6Aohgh1olbcWOR3g
 eGnvSdmsEJ6d8cM8oHht5zQCtknJJuAeH9E/2rS9d5wHwb0dOT06x1Ka526c839KAtWA
 OTu6qp8WBlp+lmgK1vJL5L2BasL/gtpRzVEF1kPHqYPmPIn+aiMnLU7Kb5w2UWQ7Holj
 /p3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ig2mq+AH5o0UP+b5KHhG9X0qqULQtiCnJDgxb4T5GVk=;
 b=WYV04JuNDWrRuUr6KRpyB7wIUxY8n1yb/5eqvsXy8BTTJUdpr842g6NxvuFSmuufQN
 u71YQRuZtH2lH4V1H/A5dcdzfYCnfo03nBBntPuoeSWll7M4ZA01ogwK06Zs5+QnXcaL
 g1GRt15qI1XKRP5mc+QZjgHm4g7+1JbCju4QXz2/Iuc9B3ixYsCukOfW2KzpP/y814UX
 ft6T4KFP6hFsQ1U0T/4EJqeTCkDLnRAUnWfrvFjAUWW8ldb6tCgQe6JuNTR8ThyFvA0F
 U/E5w3zphSSOi4McJSio4uNUy+SR7QWs0I37c09NngUKIC81UH3ekAR5PP3WGpU1UOd+
 rpuA==
X-Gm-Message-State: AGi0PuY2+92Pm5mgRkV9+1pPz/b62G4BHYHDFlvXrqem6AxHLmEvB2cG
 QMLj02rbgHfz+8S3tOgPhQdjeM1UnIN10YAECDImAQ==
X-Received: by 2002:a92:3a8c:: with SMTP id i12mr1977302ilf.69.1586259159061; 
 Tue, 07 Apr 2020 04:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200323113227.3169-1-beata.michalska@linaro.org>
 <20200323113227.3169-3-beata.michalska@linaro.org>
 <20200403084435.zvfewiivn7orsnll@kamzik.brq.redhat.com>
 <CAFEAcA8fMzWhvt0R9MhXuLYb4Wo+Yz484HNC9YAE59yxz5xD0w@mail.gmail.com>
In-Reply-To: <CAFEAcA8fMzWhvt0R9MhXuLYb4Wo+Yz484HNC9YAE59yxz5xD0w@mail.gmail.com>
From: Beata Michalska <beata.michalska@linaro.org>
Date: Tue, 7 Apr 2020 12:32:28 +0100
Message-ID: <CADSWDzsmpeXVKjDT7jKnx2XN18EWNOPsYJuxEUytofq8VZePww@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] target/arm: kvm: Handle potential issue with dabt
 injection
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7080173194101324153=="
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: LzT7ZlzByZu9

--===============7080173194101324153==
Content-Type: multipart/alternative; boundary="000000000000b2abce05a2b1bd16"

--000000000000b2abce05a2b1bd16
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Apr 2020 at 12:24, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 3 Apr 2020 at 09:44, Andrew Jones <drjones@redhat.com> wrote:
> >
> > On Mon, Mar 23, 2020 at 11:32:27AM +0000, Beata Michalska wrote:
> > > Injecting external data abort through KVM might trigger
> > > an issue on kernels that do not get updated to include the KVM fix.
> > > For those and aarch32 guests, the injected abort gets misconfigured
> > > to be an implementation defined exception. This leads to the guest
> > > repeatedly re-running the faulting instruction.
> > >
> > > Add support for handling that case.
> > > [
> > >   Fixed-by: 018f22f95e8a
> > >       ('KVM: arm: Fix DFSR setting for non-LPAE aarch32 guests')
> > >   Fixed-by: 21aecdbd7f3a
> > >       ('KVM: arm: Make inject_abt32() inject an external abort
instead')
> > > ]
> > >
>
> > I'll leave the decision to take this KVM bug workaround patch at all to
Peter,
> > and I didn't actually review whether or not
kvm_arm_verify_ext_dabt_pending
> > is doing what it claims it's doing, so I'm reluctant to give an r-b on
> > this patch. But, as far as the code goes, besides the comments above, it
> > looks fine to me.
>
> I think that having the workaround for the broken kernels is
> reasonable (in fact it might have been my suggestion).
>

I will update the current version to cover the review feedback
and resend the patches soon.

Thanks a lot!

BR
Beata
> thanks
> -- PMM

--000000000000b2abce05a2b1bd16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br>
<br>
On Tue, 7 Apr 2020 at 12:24, Peter Maydell &lt;<a href=3D"mailto:peter.mayd=
ell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; On Fri, 3 Apr 2020 at 09:44, Andrew Jones &lt;<a href=3D"mailto:drjone=
s@redhat.com" target=3D"_blank">drjones@redhat.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Mon, Mar 23, 2020 at 11:32:27AM +0000, Beata Michalska wrote:<=
br>
&gt; &gt; &gt; Injecting external data abort through KVM might trigger<br>
&gt; &gt; &gt; an issue on kernels that do not get updated to include the K=
VM fix.<br>
&gt; &gt; &gt; For those and aarch32 guests, the injected abort gets miscon=
figured<br>
&gt; &gt; &gt; to be an implementation defined exception. This leads to the=
 guest<br>
&gt; &gt; &gt; repeatedly re-running the faulting instruction.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Add support for handling that case.<br>
&gt; &gt; &gt; [<br>
&gt; &gt; &gt;=C2=A0 =C2=A0Fixed-by: 018f22f95e8a<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(&#39;KVM: arm: Fix DFSR setting f=
or non-LPAE aarch32 guests&#39;)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0Fixed-by: 21aecdbd7f3a<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(&#39;KVM: arm: Make inject_abt32(=
) inject an external abort instead&#39;)<br>
&gt; &gt; &gt; ]<br>
&gt; &gt; &gt;<br>
&gt;<br>
&gt; &gt; I&#39;ll leave the decision to take this KVM bug workaround patch=
 at all to Peter,<br>
&gt; &gt; and I didn&#39;t actually review whether or not kvm_arm_verify_ex=
t_dabt_pending<br>
&gt; &gt; is doing what it claims it&#39;s doing, so I&#39;m reluctant to g=
ive an r-b on<br>
&gt; &gt; this patch. But, as far as the code goes, besides the comments ab=
ove, it<br>
&gt; &gt; looks fine to me.<br>
&gt;<br>
&gt; I think that having the workaround for the broken kernels is<br>
&gt; reasonable (in fact it might have been my suggestion).<br>
&gt;<br>
<br></div><div>
I will update the current version to cover the review feedback<br>
and resend the patches soon.<br>
<br>
Thanks a lot!<br>
<br>
BR<br>
Beata<br>
&gt; thanks<br>
&gt; -- PMM<br>
</div>

--000000000000b2abce05a2b1bd16--

--===============7080173194101324153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm

--===============7080173194101324153==--
