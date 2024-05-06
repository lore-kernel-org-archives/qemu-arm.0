Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1363967ejc;
        Sun, 5 May 2024 23:14:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQam/PkIZA/eXGHbkkp6mDwjDmF5vgXpjY0CoyqegqZnLk8mnYqs0UiLLhbHbTxBTOo8QrEWOoD9ViOAWn81A5/3EXKPQb
X-Google-Smtp-Source: AGHT+IGRN/Q6hOcUZ28t01A9nDbYKrBwI1eISbpcEeGMpBkjkgL7zDk4pyRhat1vZ+8b1PhGOauS
X-Received: by 2002:ac8:7f46:0:b0:43a:f22a:8f56 with SMTP id g6-20020ac87f46000000b0043af22a8f56mr11400106qtk.55.1714976094033;
        Sun, 05 May 2024 23:14:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714976094; cv=none;
        d=google.com; s=arc-20160816;
        b=bPGb/fP7RMdhV2DmSx0BOn15nwZXUK1PwXxc9nM/CXNSYhYHZNuTxbnWJ4zhY6kqvk
         +GhAFDHARDt6IjdrudD3pKVFUAid69hQctpiLsElf6oNnlzeGo9PX8lT+dpsFXoyRBFL
         eGzh8XUjZkX530+EnXwHqZyExDR215/sTKioWTiP1IEFfLfRPNXsDVpf59MsIaVDh7jv
         vKClQV3LPk6+10QA6DKh0kwHnfHKRnPO+0Xh/OXs6n9+oz3ByHOHN1TphrE4wq6ugjfP
         LJHPFx2LzxOs8VHRYyvwBqANPkhr982DgECJFSwK5LKNjVxY0oW5RCbKsAh9xwo31mN1
         fvtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=LxY3MdHLQZIJ5XxGkqaAGJG/lJ+KlyDPtuW9nPr43jw=;
        fh=t2c/Q1mu5K+ATVm0gHV0wsaM55DIU+RT5LSx7/H/4mk=;
        b=LUhSTQvOYD82yu6KSYbLAIe42AC2CAhChKroRMTGCSReIOejigKhsGFcupIAfO0dwg
         769HGprwQEYdhbWhTs1GMp4rweODkbcbTTlCPR63lwLLrk3CfQSR7PdZwgOraYdqlC2s
         Hg8VOP0M+XCQo1EqAxdPw8d6GCpniGrV5QS+VC5OvaW9dcm6JXJUjlDYJ6MMIyb+APr1
         +UMyAhsyGwYnm6jhv+xeSwy9blieIsb02qUEGqTbl0daXme1lWQh8eCDYvUnWBHFdD6d
         toeCa9ZS02O6Yd7AkpcKelvP75krek61YFz+ZI8xECWZ4FLLQUWkjNq9/OAoIYJSvqpX
         rftQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bph4BrNO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13-20020a05622a1a8d00b00439f676f48csi8944547qtc.355.2024.05.05.23.14.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 23:14:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bph4BrNO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s3rcK-0007eQ-Cz; Mon, 06 May 2024 02:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tanmaynpatil105@gmail.com>)
 id 1s3rcH-0007dK-Jh; Mon, 06 May 2024 02:14:25 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tanmaynpatil105@gmail.com>)
 id 1s3rcF-0004m6-B1; Mon, 06 May 2024 02:14:25 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-23f9d07829bso272167fac.3; 
 Sun, 05 May 2024 23:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714976061; x=1715580861; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LxY3MdHLQZIJ5XxGkqaAGJG/lJ+KlyDPtuW9nPr43jw=;
 b=Bph4BrNO2hy5QBRKrdd8XuUFRWzhG/C8U7pvc/0KokMkIzTT03oJ1sDyzVq4/k+EOA
 CWJQyrjv95DMXi0JXtcZfq7EXkqX7w7SHqcmFLDwSgwqZWxBObSPyyoWXOKlB0Y0JP7B
 zKsT02fEceaFxaPTNSYZPXfClm9sn6b9m+Vbby7/VGjTQlMsPK3RHePjQaEiqqv7Makv
 SHNtJkEy+flgr6zHd/FWjK7lg68jbHhshfm34BHtllvFW8LsJNQrzdLc3TbXFpHWXn2t
 gv/xv2ugezQdSdKILqVY+IyvAEgKDlFKlIrB7dfjGBgzprvz4SqipPyIT6OwGgIjugeM
 D2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714976061; x=1715580861;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LxY3MdHLQZIJ5XxGkqaAGJG/lJ+KlyDPtuW9nPr43jw=;
 b=Te9LiIX+bs5heGEtTmnfkRWLRss8XAkddd4p2g6Jagpc4uVpKURtt7IbhPa9sQ9edR
 jXaigIw0fud8p7Pu4iSWcDxgl91VG+l6Au4g/J80pEQUec5yyBumlARNJI0UeX19W7xl
 8CNq23PGGJfJ4jqbfkMV9Cup0A7pi1S9MQn+b0zsNJFxFweMq21fVFbJFt4igVB2pC/W
 6k1V20rj2CYfEC+oLejo0P3fXS5mXP0DqmBaSWNDRtJkFsoGlSBnArw80S2BurQWgdnZ
 3O4xlgtAm5ll+dMHRFuWbROoTBvb+A/4QZE6Ql8eyRLF9wLhhrA8+3b0EU80o7YWt0iv
 +Vkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMmuVWqMT7OVoDR6wBL54P8d7sZqAiBkHYlWOSNnvCeCzmC2Qcdqwsq9M6CQS6/AKzQrMMFjPgMHWjWH7FvGy5CKw7QDMyWCqkNsV+NCPHCz/5JeebTX7bg2i5EM22ivvwfD/cH/AijulG20em2vZt6sI=
X-Gm-Message-State: AOJu0YyDNTDrNfbSnOhVyJcGqpNbH1MOq+/dYI2onrgo77nJQIGs9z/3
 i3PZXy8h6CFgZBUcgKy5MIj7g5/mDrxiCKYS1fVyBjIbheF1DmX83oZxxTOVUhOZXa+ZPnVzW5W
 iI13HMUYVCjQYSW3rJUByKkUPwl0=
X-Received: by 2002:a05:6870:8898:b0:23a:67d0:9919 with SMTP id
 m24-20020a056870889800b0023a67d09919mr11253219oam.1.1714976060978; Sun, 05
 May 2024 23:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAHnsOnM6gzcjpmEqCN0cFjZKXZCK_ZGAphuf46xWmUyBcNrAxQ@mail.gmail.com>
 <df14595f-3a26-4b7f-948d-df522f487b92@tls.msk.ru>
 <b655fa90-d9a8-475b-ac65-27bf12a48916@redhat.com>
In-Reply-To: <b655fa90-d9a8-475b-ac65-27bf12a48916@redhat.com>
From: Tanmay <tanmaynpatil105@gmail.com>
Date: Mon, 6 May 2024 11:44:07 +0530
Message-ID: <CAHnsOnP8bV+e6wfB02rmO583g3qSgW=O0FadUu2R71e3BMm4rA@mail.gmail.com>
Subject: Re: [PATCH] Fixes: Indentation using TABs and improve formatting
To: Thomas Huth <thuth@redhat.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-stable@nongnu.org, 
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e9bf940617c2fa22"
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=tanmaynpatil105@gmail.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: DokHCZ6QVVuA

--000000000000e9bf940617c2fa22
Content-Type: text/plain; charset="UTF-8"

Sure, I'll do it!

Thanks,
Tanmay

On Mon, 6 May 2024 at 10:11, Thomas Huth <thuth@redhat.com> wrote:

> On 04/05/2024 22.34, Michael Tokarev wrote:
> > 04.05.2024 21:58, Tanmay wrote:
> >> Hi,
> >>
> >> I have attached a patch file that fixes indentation and formatting for
> >> some files as listed in
> https://gitlab.com/qemu-project/qemu/-/issues/373
> >> <https://gitlab.com/qemu-project/qemu/-/issues/373>.
> >
> > it is sort of good you posted this patch to stable@.  It has absolutely
> > nothing to do
> > with stable, but it serves as a an example of things which should - in
> my
> > opinion -
> > not be done at all.
>
> I disagree. Yes, clean-up patches like this make it somewhat difficult to
> backport other patches to stable, but that should not be the reason to not
> do cleanups at all. If we keep badly formatted code in the repository,
> people will copy-n-paste it to other places, or if you have to do fixes in
> sources that have mixed TABs and spaces, you often get complaints from
> checkpatch.pl though it is not your fault. So we should get this straight
> at
> one point in time.
>
> So, Tanmay, could you please resend your patch, this time to
> qemu-devel@nongnu.org instead of qemu-stable, and CC: qemu-arm@nongnu.org
> and the corresponding ARM maintainers (you can use
> scripts/get_maintainers.pl to find out the correct maintainers that
> should
> be CC:-ed). And if possible, please send your patch inline and not as an
> attachment (so it's possible to comment on the patch via hitting the reply
> button), preferably with "git send-email" instead of using your e-mail
> program.
>
>   Thanks!
>    Thomas
>
>

--000000000000e9bf940617c2fa22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Sure, I&#39;ll do it!<br><br></div>Thanks,<br></=
div>Tanmay<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, 6 May 2024 at 10:11, Thomas Huth &lt;<a href=3D"mai=
lto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On 04/05/2024 22.34, Michael Tokarev =
wrote:<br>
&gt; 04.05.2024 21:58, Tanmay wrote:<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; I have attached a patch file that fixes indentation and formatting=
 for <br>
&gt;&gt; some files as listed in <a href=3D"https://gitlab.com/qemu-project=
/qemu/-/issues/373" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com=
/qemu-project/qemu/-/issues/373</a> <br>
&gt;&gt; &lt;<a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/373" =
rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-=
/issues/373</a>&gt;.<br>
&gt; <br>
&gt; it is sort of good you posted this patch to stable@.=C2=A0 It has abso=
lutely <br>
&gt; nothing to do<br>
&gt; with stable, but it serves as a an example of things which should - in=
 my <br>
&gt; opinion -<br>
&gt; not be done at all.<br>
<br>
I disagree. Yes, clean-up patches like this make it somewhat difficult to <=
br>
backport other patches to stable, but that should not be the reason to not =
<br>
do cleanups at all. If we keep badly formatted code in the repository, <br>
people will copy-n-paste it to other places, or if you have to do fixes in =
<br>
sources that have mixed TABs and spaces, you often get complaints from <br>
<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">check=
patch.pl</a> though it is not your fault. So we should get this straight at=
 <br>
one point in time.<br>
<br>
So, Tanmay, could you please resend your patch, this time to <br>
<a href=3D"mailto:qemu-devel@nongnu.org" target=3D"_blank">qemu-devel@nongn=
u.org</a> instead of qemu-stable, and CC: <a href=3D"mailto:qemu-arm@nongnu=
.org" target=3D"_blank">qemu-arm@nongnu.org</a> <br>
and the corresponding ARM maintainers (you can use <br>
scripts/<a href=3D"http://get_maintainers.pl" rel=3D"noreferrer" target=3D"=
_blank">get_maintainers.pl</a> to find out the correct maintainers that sho=
uld <br>
be CC:-ed). And if possible, please send your patch inline and not as an <b=
r>
attachment (so it&#39;s possible to comment on the patch via hitting the re=
ply <br>
button), preferably with &quot;git send-email&quot; instead of using your e=
-mail program.<br>
<br>
=C2=A0 Thanks!<br>
=C2=A0 =C2=A0Thomas<br>
<br>
</blockquote></div>

--000000000000e9bf940617c2fa22--
