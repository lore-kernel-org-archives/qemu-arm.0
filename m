Received: by 10.28.4.212 with SMTP id 203csp2206268wme;
        Thu, 3 May 2018 11:18:14 -0700 (PDT)
X-Received: by 2002:a9d:2842:: with SMTP id h2-v6mr18651325otd.210.1525371494691;
        Thu, 03 May 2018 11:18:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525371494; cv=none;
        d=google.com; s=arc-20160816;
        b=cisfplPrst6XpICA8r3W5pDX9KT5+o4kzyE1fhNlSUKdUiPRADY04S9clZ9j/GFFE6
         RlIYRcTiwNnbQBNMxku+P9Jb3GfVco0VvVhwO82RyQLW8DYS73dijTHGvqzyQYV22I1s
         b1iTSj7kZKwFGAcbiok+Yqnq0huz4buq6OtFpSrlYa9Ptb2a2ztQajGQ3lGTwbM3IHWT
         1ViCdYUucTVOvyrLHVi/SBJCnKNbPkfc5OqkSw83QnU+vmBxONArsoIH/1V9sNeRB9nY
         WVRoHJlRYx2rT8iwNIsiv79Ek4fAPv6BCEnM/ZnJ3JN93zCl0dDwGLTO8eNE/R+RMLBI
         JB4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=RbUjnxsB2QNcqY1FfWshajOALJENo8uCWrUOYYSmzxE=;
        b=DKU8vrZy2nExCMoKk7rPTBOIHa089H3lpl428doU+IBIJxD7v19lgFnc8m6n0zcpi2
         fueEK5c+XI2Q1scY/EWM1jAM5ayTLo63UBouHnfOa+JWT70568q7npKezo+opWCQOofi
         6RbhFKtcDP62QXPA4+pjEwZ1t1UViqZ+bQbk/RdqqwgQkiGfF4yN3bjVxX+Qri+0sACj
         jOMqwpcsQiOsnAeJjNadlxuk8lzVJ4YDlyrzXH/+MQnIWh/GB77hXffNmEoOwewmm3tV
         PRu6CRw7Row1FmpjBtOcN8M5INIURLBvsdSZVDlfsdl3z2kSFecWGv3RCjpcw8xM61ZG
         g2iA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g8S/3b47;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o129-v6sor5764571oig.0.2018.05.03.11.18.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 May 2018 11:18:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g8S/3b47;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RbUjnxsB2QNcqY1FfWshajOALJENo8uCWrUOYYSmzxE=;
        b=g8S/3b47MF4mwbK1B3/u35hDoBcfkGZFGkWOnd5mDFuw8WUZC8NaJ69n54IVMdYNd2
         aeCUJQPLoeEto/bA7/ceElRGRviMMQS5CgMU0L4S/LTIWPW7PQ7qsOz0jM2CiNqAsQuP
         y+MvNKsouOutYO/GvSl8nKg/e6nVNsMK+bqOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RbUjnxsB2QNcqY1FfWshajOALJENo8uCWrUOYYSmzxE=;
        b=KJt/JRbPNnUe2RNYKhGvBK3V1z4NmHaJlXJyQ24IAGKmqJTDcFFrK+2gEZt5R+DwEK
         TwaUIfGbNFYr24y1vzyDZKh8zJA6tcW42krPsaeUYJ8Vn6paQ1D6/UpewUTBVBv4xQF1
         41tMma871cw0Q77d3zVlaLk2dVO/cdmgEKtvcMqIlRbftFrgw47aZvhMlDGwegjK4dDX
         twG3I8Nlk678tLtB0+x2H6wgZnGvAWezGJNi94fQ5snj9H+/MEnSnq9ExaMe0np8htXU
         NRY6Q+L8aq1PBg29lK5KjqKeT5RbJkWaeE36Gk2o7HPJnaHhb+48N6dI9HUjicT0B7VE
         r0Lg==
X-Gm-Message-State: ALQs6tDo5E0Dl1XxJhDOkN0FnEpQ4inz7iEqA/eZPA9ASCCZwDvHJera
	ZI35OqG1uCdKJh+CJV9Sc0iDIWFAPoyAXQD8nMOR/ex663c=
X-Google-Smtp-Source: AB8JxZpeCL7GKH+hu3C6jhLpumR7YbeC8qhI3bJfxzGRRCEQtgELNPreNeDI2Ob9XPNgprJNU1n4gJQoCO9Kwenf37w=
X-Received: by 2002:aca:b855:: with SMTP id i82-v6mr15284943oif.12.1525371493936;
 Thu, 03 May 2018 11:18:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 3 May 2018 11:17:53 -0700 (PDT)
In-Reply-To: <20180502154344.10585-3-alex.bennee@linaro.org>
References: <20180502154344.10585-1-alex.bennee@linaro.org> <20180502154344.10585-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 May 2018 19:17:53 +0100
Message-ID: <CAFEAcA80vTz25WHGKteTU3nxSi2fUHN8dp+z8paNP03conAghQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] fpu/softfloat: support ARM Alternative half-precision
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: B/4WVRLh05XA

On 2 May 2018 at 16:43, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> For float16 ARM supports an alternative half-precision format which
> sacrifices the ability to represent NaN/Inf in return for a higher
> dynamic range. To support this I've added an additional
> FloatFmt (float16_params_ahp).
>
> The new FloatFmt flag (arm_althp) is then used to modify the behaviour
> of canonicalize and round_canonical with respect to representation and
> exception raising.
>
> Finally the float16_to_floatN and floatN_to_float16 conversion
> routines select the new alternative FloatFmt when !ieee.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  fpu/softfloat.c | 97 +++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 74 insertions(+), 23 deletions(-)

I found some corner cases where this patchset introduces
regressions; details below... They're not all althp related
but I started composing this email in reply to patch 2/3 and
don't want to try to move it to replying to the cover letter now :-)


(1) Here's an example of a wrong 32->16 conversion in alt-hp mode:
for FCVT h5, s0 where s0 is an SNaN, then your code gives 0x7E00
when it should give 0x0, because float16a_round_pack_canonical()
tries to return a NaN, which doesn't exist in alt-HP.

In the Arm ARM pseudocode this case is handled by the
FPConvert pseudocode, which treats alt_hp specially
when the input is a NaN. On that analogy I put this into
float_to_float(), which seems to have the desired effect:

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 25a331158f..1cc368175d 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -1256,6 +1256,17 @@ static FloatParts float_to_float(FloatParts a,
             s->float_exception_flags |=3D float_flag_invalid;
         }

+        if (dstf->arm_althp) {
+            /* There is no NaN in the destination format: raise Invalid
+             * and return a zero with the sign of the input NaN.
+             */
+            s->float_exception_flags |=3D float_flag_invalid;
+            a.cls =3D float_class_zero;
+            a.frac =3D 0;
+            a.exp =3D 0;
+            return a;
+        }
+
         if (s->default_nan_mode) {
             a.cls =3D float_class_dnan;
             return a;

(2) You're also failing to set the Inexact flag for cases like
 fcvt h1, s0     where s0 is 0x33000000
which should return result of 0, flags Inexact | Underflow,
but is after this patchset returning just Underflow.

I think this is because you're not dealing with the
odd handling of flush-to-zero for half-precision:
in the v8A Arm ARM pseudocode, float-to-float conversion
uses the FPRoundCV() function, which squashes FZ16 to 0,
and FPRoundBase() looks at fpcr.FZ for 32 and 64 bit floats
but fpcr.FZ16 for 16 bit floats. (FZ16 exists only with the
halfprec extension, and effectively applies only for the
data processing and int<->fp conversions -- see FPRound().)

In our old code we handled this implicitly by having
roundAndPackFloat16() not check status->flush_to_zero the way
that roundAndPackFloat32/64 did. Now you've combined them all
into one code path you need to do some special casing, I think.
This change fixes things for the fcvt case, but (a) is a
dubious hack and (b) you'll want to do something different
to handle FZ16 for actual arithmetic operations on halfprec.
If architectures other than Arm use halfprec (MIPS seems to)
then we should check what their semantics are to see if they
match Arm.

--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -453,7 +453,7 @@ static FloatParts round_canonical(FloatParts p,
float_status *s,
                     flags |=3D float_flag_inexact;
                 }
             }
-        } else if (s->flush_to_zero) {
+        } else if (s->flush_to_zero && parm->exp_size !=3D 5) {
             flags |=3D float_flag_output_denormal;
             p.cls =3D float_class_zero;
             goto do_zero;

(3) Here's a NaN case we get wrong now: 64 to IEEE-16 conversion,
input is 0x7ff0000000000001 (an SNaN), we produce
0x7c00 (infinity) but should produce 0x7e00 (a QNaN).

This is because this code in float16a_round_pack_canonical():

    case float_class_msnan:
        return float16_maybe_silence_nan(float16_pack_raw(p), s);

doesn't consider the possibility that float16_pack_raw()
ends up with something that's not a NaN. In this case
because the float-to-float conversion has thrown away the
bottom bits of the double's mantissa, we have p.frac =3D=3D 0,
and float16_pack_raw() gives 0x7c00, which is an infinity,
not a NaN. So when float16_maybe_silence_nan() calls
float16_is_signaling_nan() on it it returns false and then
we don't change the SNaN bit.

The code as of this patch seems to be a bit confused:
it does part of the conversion of NaNs from one format
to the other in float_to_float() (which is where it's
fiddling with the frac bits) and part of it in
the round_canonical() case (where it then messes
about with quietening the NaN). In an ideal world
this would all be punted out to the softfloat-specialize
code to convert with access to the full details of the
input number, because it's impdef how NaN conversion handles
the fraction bits. Arm happens to choose to use the
most significant bits of the fraction field, but there's
no theoretical reason why you couldn't have an
implementation that wanted to preserve the least
significant bits, for instance.

Note also that we currently have workarounds at the target/arm
level for the softfloat code not quietening input NaNs for
fp-to-fp conversion: see the uses of float*_maybe_silence_nan()
after float*_to_float* calls in target/arm/helper.c.
If the softfloat code is now going to get these correct then
we can drop those. HPPA, MIPS, RISCV and S390x have similar
workarounds also. Overall, the maybe_silence_nan function
was a dubious workaround for not having been able to do
the NaN handling when we had a fully unpacked value, and
perhaps we can minimise its use or even get rid of it...
(target/i386 notably does not do this, we should check how
SSE and x87 handle NaNs in fp conversions first.)

thanks
-- PMM
